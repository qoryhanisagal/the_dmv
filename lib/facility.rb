class Facility
  # This line defines getter methods for name, address, phone, and services.
  # These attributes can be accessed outside the class but can't be modified directly.
  attr_reader :name, :address, :phone, :services

  # The initialize method is the constructor for the Facility class.
  # It takes a hash (facility_details) as an argument which contains the name, address, and phone.
  # We extract these values from the hash and assign them to instance variables.
  # An empty array is initialized for @services to hold the services provided by this facility.
  def initialize(facility_details)
    @name = facility_details[:name]      # Extract the name from the facility_details hash
    @address = facility_details[:address]  # Extract the address from the facility_details hash
    @phone = facility_details[:phone]    # Extract the phone number from the facility_details hash
    @services = []                       # Initialize an empty array to store the services offered by this facility
  end

  # This method allows the facility to add a service to its list of services.
  # The service is passed as an argument and added to the @services array.
  def add_service(service)
    @services << service  # Add the provided service to the @services array
  end
end