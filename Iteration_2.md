# Iteration 2 - Adding Features and Creating Objects from Data Sources

## Overview
In this iteration, I extended the **Facility** class to administer a variety of DMV services such as **vehicle registration**, **written tests**, **road tests**, and **driver’s license renewals**. The registration logic applies different fees based on vehicle types, and each service requires the facility to offer the relevant service before it can be performed. I also focused on integrating external data for creating vehicle objects using a service class.

## New Classes and Methods
### Methods Added:
1. **register_vehicle**:
   - Registers a vehicle, sets the registration date, and applies appropriate fees based on the vehicle type (regular, antique, electric).
  
2. **administer_written_test**:
   - Administers a written test to eligible registrants (age 16+, with a permit).

3. **administer_road_test**:
   - Administers a road test if the registrant has passed the written test.

4. **renew_drivers_license**:
   - Renews a license if the registrant has a valid license.

## Test Failures and Fixes
1. **Test: Written Test Eligibility**
   - **Failure Reason**: Registrants without a permit or under age 16 were incorrectly allowed to take the test.
   - **Fix**: Added condition checks in the `administer_written_test` method to restrict access to eligible registrants only.

2. **Test: Road Test**
   - **Failure Reason**: Registrants who had not passed the written test were able to take the road test.
   - **Fix**: Updated the `administer_road_test` method to check the status of the written test in the registrant's `license_data` hash.

## TDD Process
1. **Start with Writing Tests**: I first wrote unit tests for each new service: vehicle registration, written test, road test, and license renewal.
2. **Implementation**: After each test was written, I implemented the corresponding method in the `Facility` class.
3. **Refinement and Debugging**: As we ran the tests, I fixed any issues or failures, ensuring that all methods adhered to the expected behavior.
4. **Final Testing**: After completing the functionality, I ensured all edge cases were covered and tests passed successfully.

## Reflection
- **Steps to Add Classes**: The process involved carefully understanding the requirements for each service, adding them one by one, and ensuring that they adhered to the rules (e.g., age and permit requirements for tests). Each method was added incrementally after writing the corresponding test.
  
- **Challenges**: One of the challenges was handling edge cases such as attempting to administer a road test when the written test had not been passed, and ensuring that only facilities offering a service could perform it.

- **What was Easier**: Adding the vehicle registration logic was straightforward since the different fees and conditions could easily be mapped to vehicle attributes such as `year` and `engine type`.