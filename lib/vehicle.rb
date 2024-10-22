class Vehicle
  # These attributes are readable from outside the class.
  attr_accessor :plate_type, :registration_date # Added attributes that can be modified
  attr_reader :vin, :year, :make, :model, :engine

  # The initialize method takes a hash of vehicle details and assigns them to instance variables.
  # It also initializes @registration_date to nil, indicating the vehicle is not yet registered.
  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]           # Vehicle Identification Number
    @year = vehicle_details[:year]         # Year of manufacture
    @make = vehicle_details[:make]         # Vehicle's make (e.g., Chevrolet)
    @model = vehicle_details[:model]       # Vehicle's model (e.g., Cruz)
    @engine = vehicle_details[:engine]     # Type of engine (e.g., :ice for internal combustion engine)
    @registration_date = nil               # Initially, the vehicle is unregistered, so set to nil
    @plate_type = nil                      # Initially,no plate assigned, so set to nil
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