# Iteration 3 - Creating Objects from Multiple Data Sets and Analyzing Our Data

## Overview
In this iteration, the focus was on implementing functionality to create Facility objects from multiple external data sources, specifically focusing on Colorado DMV offices. This was achieved by enhancing the `DmvDataService` to include methods for accessing the necessary data and using the `FacilityFactory` to convert that data into objects.

## New Features Implemented
- **VehicleFactory Class**: This class was developed to create Vehicle objects from the data retrieved from the DmvDataService. It handles the creation of vehicle instances based on specific attributes.
  
- **FacilityFactory Class**: Similar to VehicleFactory, this class was implemented to create Facility objects from data about DMV facilities. It takes an array of hashes containing facility information and maps them to Facility instances.

## Test Failures and Fixes
- **No major test failures encountered** during this iteration. All tests for the VehicleFactory and FacilityFactory passed successfully, indicating that the functionality was implemented correctly.

## TDD Process
- The Test-Driven Development (TDD) approach was followed by writing tests for the `VehicleFactory` and `FacilityFactory` classes before implementing their respective methods. 
- Each test was designed to confirm that the data was being transformed correctly into object instances, ensuring that attributes were assigned accurately based on the input data.

### Steps Followed:
1. **Write Tests**: Tests were first written to define the expected behavior of the `create_vehicles` and `create_facilities` methods.
2. **Run Tests**: The tests were executed, confirming that they failed before any implementation was done.
3. **Implement Functionality**: The necessary methods in the VehicleFactory and FacilityFactory classes were then implemented.
4. **Run Tests Again**: After implementing the methods, the tests were run again to ensure they now passed successfully, indicating correct functionality.

## Reflection
- **Challenges**: One challenge faced during this iteration was ensuring that the data format from the external sources matched the expected input for the factory methods. Handling any discrepancies in data formats required careful attention to detail and adjustments in the implementation.
  
- **Successes**: A significant success was the seamless integration of the data retrieval process with the object creation process. The use of TDD helped ensure that the implemented features were working as intended from the outset, reducing the need for extensive debugging later in the process.

# DMV data will come as potentially 1,000 arrays.
#### The challenge here is to organize the data. Assign arrays to class objects.
