# Iteration 1 - Learning the Existing Codebase

## Overview
In this iteration, we explored the existing codebase and familiarized ourselves with the classes, methods, and tests already in place. The goal was to identify any bugs in the application code and debug the project until all tests passed.

## Test Failures and Fixes
1. Test: [Description of test]
   - **Failure Reason**: [Explanation of why it failed]
   - **Fix**: [Description of how the issue was resolved]
   
## Successes
- Successfully explored and understood the relationships between `Facility`, `Dmv`, and `Vehicle` classes.
- All existing tests pass after resolving bugs in the application code.

## Application Logic
- The `Dmv` class handles facilities and their services.
- The `Vehicle` class defines vehicle properties and implements methods such as `antique?` and `electric_vehicle?`.

## TDD Process
- Refactored code in small steps, ensuring tests passed after each refactor.
- Used test failures to guide debugging.
#### Test 1: Facility Initialization
- Test is tring to intilalize the Facility class with a hash, the class expects three separate arguement (name, address, phone).
### Step 1: Analyze the Current Code
#### **Facility Class:**
- The initialize method expects three separate arguments (name, address, phone), but your test is passing a **hash** instead.
#### **facility_spec.rb:**
- Here, the test is passing a hash with keys (name, address, phone) to the Facility.new method, which is inconsistent with the initialize method.
### Step 2: Write the Correct Initialization (TDD Process)
#### Fix:
 - I need to modify the initialize method in the Facility class to accept a hash instead of individual arguments.
 ##### Modify the Facility Class:
```` ruby
class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
````
#### Key Notes:
- This change allows the initialize method to accept a hash and extract name, address, and phone from the hash, aligning with the way it’s being called in the test file.
### Step 3: Update the add_service Method

### Step 4: Rerun the Tests

### Step 5: Commit Changes
## Reflection
- **Steps to Explore Codebase**: [What you did to understand the code].
- **Challenges**: [What was difficult about working with unfamiliar code].
- **What was Easier**: [What was easier than expected].