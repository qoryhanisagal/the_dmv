# lib/registrant.rb
class Registrant
  # Create getter methods for name, age, and license_data, and a method for checking the permit status
  attr_reader :name, :age, :license_data

  # Initializes the registrant with name, age, and permit (default false)
  def initialize(name, age, permit = false)
    @name = name                   # Assign the name passed as an argument
    @age = age                     # Assign the age passed as an argument
    @permit = permit               # If no permit value is provided, it defaults to false
    @license_data = {              # Set up the default license_data hash
      written: false, 
      license: false, 
      renewed: false 
    }
  end

  # Method to check if the registrant has a permit
  def permit?
    @permit                        # Returns true if the registrant has a permit, false otherwise
  end

  # Method to update the permit status to true (if the registrant earns a permit)
  def earn_permit
    @permit = true                 # Change the permit status to true
  end
end
# Registrant class needs to be dynamic
# What questions can the method mutation provide?
# What are the effects?