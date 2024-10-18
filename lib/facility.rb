class Facility
  # This line defines getter methods for name, address, phone, services, registered_vehicles, and collected_fees.
  # These attributes can be accessed outside the class but can't be modified directly.
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  # The initialize method is the constructor for the Facility class.
  # Update # The initialize method sets up the facility with basic details and initializes empty arrays and a fee counter.
  # It takes a hash (facility_details) as an argument which contains the name, address, and phone.
  # We extract these values from the hash and assign them to instance variables.
  # An empty array is initialized for @services to hold the services provided by this facility.
  def initialize(facility_details)
    @name = facility_details[:name]        # Extract the name from the facility_details hash
    @address = facility_details[:address]  # Extract the address from the facility_details hash
    @phone = facility_details[:phone]      # Extract the phone number from the facility_details hash
    @services = []                         # Initialize an empty array to store the services offered by this facility
    @registered_vehicles = []              # Stores the registered vehicles
    @collected_fees = 0                    # Stores total fees collected by the facility
  end

  # This method allows the facility to add a service to its list of services.
  # The service is passed as an argument and added to the @services array.
  # Update: Method to add services to the facility (e.g., 'Vehicle Registration')
  def add_service(service)
    @services << service  # Add the provided service to the @services array
  end

  # Method to register a vehicle if the 'Vehicle Registration' service is offered
  def register_vehicle(vehicle)
    return unless @services.include?('Vehicle Registration')  # Ensure service is available

    vehicle.registration_date = Date.today  # Set today's date as registration date

    # Determine the plate type and the associated registration fee
    if vehicle.antique?
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
    end

    @registered_vehicles << vehicle  # Add the vehicle to the list of registered vehicles
  end
end