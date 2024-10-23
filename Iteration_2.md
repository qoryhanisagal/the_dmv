# Iteration 2 - Adding Features and Creating Objects from Data Sources

## Overview
In this iteration, the focus was on enhancing the system's capabilities by adding the `Registrant` class and establishing its interaction with the `Facility` class. This allows for better management of users and their interactions with DMV services, particularly in the context of vehicle registration and testing processes.

## New Classes and Methods
- **Registrant Class**: 
  - Created to manage user data, including attributes such as name, age, permit status, and license data.
  - **Methods Added**:
    - `earn_permit`: Updates the registrant’s permit status based on their age.

- **Facility Class Updates**:
  - Added methods for administering written tests and road tests to registrants, thereby enhancing the functionality of the facility in relation to user registration and licensing processes.

## Test Failures and Fixes
1. **Test**: Testing the `earn_permit` method for the `Registrant` class.
   - **Failure Reason**: Initial tests failed because the logic to determine permit eligibility was not correctly implemented.
   - **Fix**: Adjusted the logic in the `earn_permit` method to properly set the permit status based on age criteria.

2. **Test**: Administering written tests in the `Facility` class.
   - **Failure Reason**: Tests for `administer_written_test` failed when checking conditions for age and permit status.
   - **Fix**: Updated the method logic to correctly evaluate eligibility for taking the written test.

## TDD Process
- Followed a Test-Driven Development (TDD) approach by writing tests for the `Registrant` and `Facility` functionalities before implementing the corresponding methods.
- Each test failure guided the development of specific functionality, ensuring that the implemented features aligned with expected outcomes.

## Reflection
- **Steps to Add Classes**: The process involved defining the `Registrant` class and its attributes, writing tests for the class, and implementing the required methods based on those tests.
- **Challenges**: A challenge was managing the relationships between classes and ensuring that the logic for eligibility was clear and correctly implemented. There were also difficulties in maintaining existing logic while adding new features.
- **Successes**: Successfully establishing the interaction between `Registrant` and `Facility` classes was a major win. The use of binding.pry was particularly helpful in debugging and understanding how the new features integrated with existing code.



