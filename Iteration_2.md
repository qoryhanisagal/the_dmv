# Iteration 2 - Object-Oriented Design Enhancement

## Overview
This iteration focused on improving the object-oriented design by adding the `Registrant` class. We also established relationships between classes using OOP principles.

## New Classes and Methods
- Created `Registrant` class to manage user data such as name, age, permit status, and license data.
- Added `earn_permit` method to change a registrant’s permit status.

## Test Failures and Fixes
1. Test: [Description of test for `Registrant` class]
   - **Failure Reason**: [Explanation of why it failed]
   - **Fix**: [Description of how the issue was resolved]
   
## TDD Process
- Started with tests for `Registrant` and gradually built the class to meet requirements.
- Used interaction patterns to guide method design.

## Reflection
- **Steps to Add Classes**: [What was the process for adding new classes].
- **Challenges**: One challenge was dealing with unfamiliar parts of the code, particularly when implementing new features like the vehicle registration functionality. Understanding the flow between services offered by a facility and the vehicle class attributes took time to figure out. Another difficulty was maintaining the logic when adding new services to the facility while ensuring they adhered to the existing service framework.
- **What was Easier**: It was easier than expected to work with the tests once I understood how the existing structure was built. The well-structured nature of the tests helped me see where new functionality needed to be added. Using binding.pry also made it easier to debug by allowing real-time inspection of object states, which gave quick feedback when something wasn’t working as expected.


