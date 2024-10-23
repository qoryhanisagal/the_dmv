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

## Successes
- Successfully explored and understood the relationships between `Facility`, `Dmv`, and `Vehicle` classes.
- All existing tests pass after resolving bugs in the application code.

## Application Logic
- The `Dmv` class handles facilities and their services.
- The `Vehicle` class defines vehicle properties and implements methods such as `antique?` and `electric_vehicle?`.

# TDD Process
- Refactored code in small steps, ensuring tests passed after each refactor.
- Used test failures to guide debugging.
## Error 1:
```` ruby
ArgumentError: wrong number of arguments (given 1, expected 3)
````
### Test 1: Facility Initialization
- Test is tring to intilalize the Facility class with a hash, the class expects three separate arguement (name, address, phone).
#### Step 1: Analyze the Current Code
#### **Facility Class:**
- The initialize method expects three separate arguments (name, address, phone), but your test is passing a **hash** instead.
#### **facility_spec.rb:**
- Here, the test is passing a hash with keys (name, address, phone) to the Facility.new method, which is inconsistent with the initialize method.
#### Step 2: Write the Correct Initialization (TDD Process)
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
#### Step 3: Update the add_service Method
- There’s also a small typo in the method name. In the test, you’re calling add_service (singular), but in the Facility class, it’s named add_services (plural). 
```` ruby
class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
````
#### Step 4: Rerun the Tests
```` ruby
rspec
````
#### Step 5: Commit Changes
- Commit changes add high-level message.

## Error 2:
```` ruby
NoMethodError: undefined method `facilities' for #<Dmv:0x0000000105a63960 @facilities=[]>
````
- The test is trying to call a method called facilities on an instance of the Dmv class, but the method is not defined.
### Test 1: 
- Looks I am trying to access an instance variable @facilities using expect(@dmv.facilities).to eq([]). However, the Dmv class does not have a method to access @facilities.
#### Step 1: Add an accessor for @facilities:
#### ** Accessor for Facilities:**
- In order to make @facilities accessible outside the class, I need to either define an accessor method for it or use attr_reader to expose the @facilities instance variable.
#### Step 2: Write the Correct Initialization (TDD Process)
#### Fix:
 ```` ruby 
class Dmv
  # This creates a getter method for facilities so it can be accessed outside the class
  attr_reader :facilities

  def initialize
    @facilities = []  # Initializes an empty array to hold facilities
  end

  # This method allows adding a facility to the list
  def add_facility(facility)
    @facilities << facility
  end
end
 ````
 -  Adding attr_reader :facilities, I created a getter method for @facilities, which allows the facilities method to be called on an instance of Dmv in the test.

#### Step 3: Rerun the Tests
```` ruby
rspec
````
#### Step 5: Commit Changes
- Commit changes add high-level message.
## Reflection
1.	**attr_reader :facilities:**
	- This line creates a getter method for the @facilities instance variable, allowing it to be accessed from outside the class. However, this variable cannot be directly modified from the outside (i.e., there’s no setter method), which enforces encapsulation.
2.	**initialize method:**
	- The initialize method is called when a new instance of the Dmv class is created. It sets up an empty array for @facilities, which will later hold the list of DMV facilities.
	- This ensures that each instance of the Dmv class starts with its own unique list of facilities.
3.	**add_facility method:**
    - This method takes a facility object as a parameter and adds it to the @facilities array.
	- This allows the Dmv class to manage a collection of facilities dynamically, which can later be retrieved using the facilities getter method.

## Error 3:
```` ruby
NoMethodError: undefined method `facilities' for #<Dmv:0x0000000105a63960 @facilities=[]>
````
- The test is trying to call this method to return a list of facilities that offer a specified service, but the method hasn’t been defined yet.

### Test 1:Add facilities_offering_service in Dmv class.
- 
#### Step 1: Implement method facilities_offering_service in the Dmv class
#### ** Accessor for Facilities:**
-I need to implement the facilities_offering_service method in the Dmv class. This method will iterate over the list of facilities and return only those that offer the requested service.
#### Fix:
 ```` ruby 
class Dmv
  attr_reader :facilities  # Getter method for facilities

  def initialize
    @facilities = []  # Initialize an empty array for storing facilities
  end

  # This method adds a facility to the @facilities array
  def add_facility(facility)
    @facilities << facility  # Add the given facility to the @facilities array
  end

  # This method returns a list of facilities that offer the specified service.
  # It iterates over the @facilities array and selects facilities that include the requested service.
  #
  # @param service [String] the name of the service to search for in the facilities.
  # @return [Array] an array of facilities that offer the specified service.
  def facilities_offering_service(service)
    @facilities.select do |facility|
      facility.services.include?(service)  # Check if the facility offers the specified service
    end
  end
end
 ````

#### Step 3: Rerun the Tests
```` ruby
rspec
````
#### Step 5: Commit Changes
- Commit changes add high-level message.
## Reflection
1.	**facilities_offering_service Method:**
    - This method takes a service parameter (e.g., ‘Road Test’) and checks each facility in the @facilities array to see if it offers that service.
	- It uses select to iterate over the array and return a new array containing only the facilities that offer the specified service.
2.	**Key Points:**
	- **facility.services.include?(service):** This line checks whether the services array of each facility contains the service being searched for.

## Error 4:
```` ruby
Failure/Error: expect(@cruz.registration_date).to eq(nil)
     
     NoMethodError:
       undefined method `registration_date' for #<Vehicle:0x0000000108539388 @vin="123456789abcdefgh", @year=2012, @make="Chevrolet", @model="Cruz", @engine=:ice>
     # ./spec/vehicle_spec.rb:17:in `block (3 levels) in <top (required)>'

````
- The Vehicle class is missing the registration_date attribute, which the test is expecting to be initialized to nil. I should be able to resolve this issue by adding a registration_date attribute to the Vehicle class and ensuring it’s initialized correctly.
### Test 1: Update Vehicle Class
- 	Add registration_date as an instance variable and initialize it to nil in the initialize method.
-   Also, add attr_reader :registration_date so that it can be accessed outside the class.
#### Step 1: Add `attr_reader`
#### **`attr_reader :registration_date`**
- This creates a getter method for the `@registration_date` instance variable, allowing it to be accessed outside the class (e.g., in the test file).
#### Step 2:Add **`registration_date = nil`**
- The initialize method sets the `@registration_date` to `nil` when a new Vehicle instance is created, as the vehicle isn’t registered initially.

#### Fix:
 ```` ruby 
class Vehicle
  # These attributes are readable from outside the class.
  attr_reader :vin, :year, :make, :model, :engine, :registration_date

  # The initialize method takes a hash of vehicle details and assigns them to instance variables.
  # It also initializes @registration_date to nil, indicating the vehicle is not yet registered.
  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]           # Vehicle Identification Number
    @year = vehicle_details[:year]         # Year of manufacture
    @make = vehicle_details[:make]         # Vehicle's make (e.g., Chevrolet)
    @model = vehicle_details[:model]       # Vehicle's model (e.g., Cruz)
    @engine = vehicle_details[:engine]     # Type of engine (e.g., :ice for internal combustion engine)
    @registration_date = nil               # Initially, the vehicle is unregistered, so set to nil
  end

  # This method determines if the vehicle is considered an antique, which is true if the car is older than 25 years.
  def antique?
    Date.today.year - @year > 25
  end

  # This method checks if the vehicle is an electric vehicle (EV) by comparing the engine type.
  def electric_vehicle?
    @engine == :ev
  end
end
 ````
 -  

#### Step 3: Write the Correct Initialization (TDD Process)
#### Step 4: Rerun the Tests
```` ruby
rspec
````
#### Step 5: Commit Changes
- Commit changes add high-level message.
