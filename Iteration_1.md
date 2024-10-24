# Iteration 1 - Learning the Existing Codebase

## Overview
In this iteration, I explored the existing codebase and familiarized ourselves with the classes, methods, and tests already in place. The goal was to identify any bugs in the application code and debug the project until all tests passed.

# Iteration 1 - Learning an Existing Codebase

## Logic and Implementation of the Registrant Class

In this iteration, I implemented the `Registrant` class to represent a user of the DMV system. The class has the following key features:

- **Attributes**: `name`, `age`, `permit`, and `license_data`.
  - **Permit** defaults to `false` if not provided.
  - **License Data** is initialized as a hash with three keys: `:written`, `:license`, and `:renewed`, all defaulting to `false`.
  
- **Methods**:
  - `permit?`: Checks if the registrant currently holds a permit.
  - `earn_permit`: Allows the registrant to earn a permit, updating the `permit` attribute from `false` to `true`.

---

## Test-Driven Development (TDD) Process

1. **Step 1: Write Tests for Initialization**:
   I started by writing tests to verify that the `Registrant` class correctly initializes with a name, age, and optional permit. The default values for the `license_data` hash were also tested.

2. **Step 2: Implement the Class**:
   After writing the tests, I implemented the class to make the tests pass. This included:
   - Defining an initializer method that accepts `name`, `age`, and `permit` (with a default value of `false`).
   - Initializing the `license_data` hash to track the registrant’s progress through the DMV process.

3. **Step 3: Write Tests for Permit Functionality**:
   I added tests to verify the behavior of the `permit?` and `earn_permit` methods. These methods control whether a registrant has earned their permit and allow this status to be updated.

4. **Step 4: Implement Permit Logic**:
   I implemented the `permit?` method to return the status of the permit and the `earn_permit` method to update the `permit` attribute to `true`.

---

## Test Failures and Fixes

1. **Test: Initialization**  
   - **Failure Reason**: Missing attributes during initialization.
   - **Fix**: Added the required parameters (`name`, `age`, and `permit`) to the `Registrant` class initializer.

2. **Test: Permit Status**  
   - **Failure Reason**: Initially, the `permit` attribute was not correctly initialized as `false`.
   - **Fix**: Set `permit` to default to `false` unless otherwise provided in the initializer.

3. **Test: License Data**  
   - **Failure Reason**: The `license_data` hash was not initialized correctly.
   - **Fix**: Ensured the `license_data` hash is always initialized with default values (`false` for `:written`, `:license`, and `:renewed`).

## Reflection
- **Steps to Explore Codebase**: To explore the codebase, I first reviewed the structure of the provided classes and methods, focusing on how the Facility and Vehicle classes interacted. I read through the initial tests to understand the expected behavior. Using binding.pry, I paused execution at key points to inspect objects and variables, which helped me visualize how data flowed through the code. Finally, I worked through any failing tests one by one, debugging and adjusting the application logic to make them pass.
- **Challenges**: One challenge was getting familiar with the code that I didn’t write myself, especially when it came to understanding how different methods and objects were interacting. Some logic wasn’t immediately clear, so I had to spend extra time debugging. It was also challenging to extend the functionality without breaking the existing structure.
- **What was Easier**: It was easier than expected to work with the tests once I understood how the existing structure was built. The well-structured nature of the tests helped me see where new functionality needed to be added. Using binding.pry also made it easier to debug by allowing real-time inspection of object states, which gave quick feedback when something wasn’t working as expected.