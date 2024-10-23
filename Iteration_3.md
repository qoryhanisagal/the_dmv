# Iteration 3 - Creating Objects from Multiple Data Sets and Analyzing Our Data

## Overview
In this iteration, the focus was on creating `Facility` objects from external data sources. We implemented functionality to parse data about DMV facilities and integrate it into our existing system. This allows for improved management of facility information and enhances user experience.

## New Features Implemented
- **FacilityFactory Class**: 
  - Created to facilitate the instantiation of `Facility` objects from external data sources.
  - **Method Added**:
    - `create_facilities`: Takes an array of data representing facilities and returns an array of `Facility` objects.

- **Integration with DmvDataService**:
  - Extended functionality to fetch data from multiple states (Colorado, New York, and Missouri) and create `Facility` objects from that data.

## Test Failures and Fixes
1. **Test**: Creating facilities from data.
   - **Failure Reason**: Initial tests failed due to improper handling of missing attributes in the data returned from the external API.
   - **Fix**: Adjusted the `create_facilities` method to handle cases where some expected attributes might be missing or formatted differently.

2. **Test**: Integration with DmvDataService.
   - **Failure Reason**: Tests for data integration failed when the expected number of facilities did not match the actual output.
   - **Fix**: Modified the test data setup to align with the actual data format returned by the API.

## TDD Process
- Employed a Test-Driven Development (TDD) approach by first writing tests for the `FacilityFactory` class and its interaction with the `DmvDataService`.
- The tests guided the development of new methods to ensure they met the expected requirements and correctly handled the provided data.

## Reflection
- **Steps to Add Classes**: The process involved defining the `FacilityFactory` class, implementing the `create_facilities` method, and writing tests to validate that the method behaves correctly with various inputs.
- **Challenges**: One challenge was understanding the structure of the data returned from the API and ensuring that it aligned with how we wanted to create `Facility` objects. Parsing and managing the data effectively required careful consideration.
- **Successes**: Successfully integrating external data sources into our application was a significant achievement. The new `FacilityFactory` class streamlined the process of creating facility objects, making the system more robust and adaptable to new data.

# From Mentor:
##### DMVdata will come as potentially 1,000 arrays.
##### The challenge here is to organize the data. Assign arrays to class objects