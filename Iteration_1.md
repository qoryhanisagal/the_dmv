# Iteration 1 - Learning the Existing Codebase

## Overview
In this iteration, we explored the existing codebase and familiarized ourselves with the classes, methods, and tests already in place. The goal was to identify any bugs in the application code and debug the project until all tests passed.

## Test Failures and Fixes

### 1. Test: Facility#initialize can initialize
- **Failure Reason**: The `Facility` class was expecting three separate arguments (`name`, `address`, `phone`), but the test was passing a hash.
- **Fix**: Updated the `Facility` class to accept a hash (`facility_details`) and extract the `name`, `address`, and `phone` keys from it. This aligns with the way the test is structured.
  
### 2. Test: Facility#add service can add available services
- **Failure Reason**: The `add_service` method name in the class was pluralized (`add_services`), but the test was calling it in singular form.
- **Fix**: Changed the method name from `add_services` to `add_service` to align with the test.

### 3. Test: Dmv#initialize can initialize
- **Failure Reason**: The `@facilities` instance variable was being initialized correctly, but there was no getter method (`facilities`) to access it in the test.
- **Fix**: Added `attr_reader :facilities` to provide access to the `@facilities` array. This allowed the test to properly access and verify the initialized empty array.

### 4. Test: Dmv#add facilities can add available facilities
- **Failure Reason**: The method was working but not accessible without a getter method.
- **Fix**: After adding `attr_reader`, the facilities array could be accessed and validated.


## Reflection
- **Steps to Explore Codebase**: [What you did to understand the code].
- **Challenges**: [What was difficult about working with unfamiliar code].
- **What was Easier**: [What was easier than expected].