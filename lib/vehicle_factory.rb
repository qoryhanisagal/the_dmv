# lib/vehicle_factory.rb

# The VehicleFactory class is responsible for creating instances of Vehicle objects from data.
class VehicleFactory
  # Method: create_vehicles
  # This method takes an array of data (typically hashes) representing vehicles.
  # It maps over the data, creating and returning an array of Vehicle objects based on the data.
  #
  # Parameters:
  # - data: An array of hashes. Each hash contains information about a vehicle (VIN, model year, make, etc.).
  #
  # Returns:
  # - An array of Vehicle objects.
  def create_vehicles(data)
    # Iterate over each entry (vehicle_data) in the provided data array
    data.map do |vehicle_data|
      # Create and return a new instance of Vehicle using the data from the current hash (vehicle_data).
      Vehicle.new({
        # Assign the VIN using the :vin_1_10 key from the data.
        vin: vehicle_data[:vin_1_10],
        # Assign the model year from the :model_year key.
        year: vehicle_data[:model_year],
        # Assign the make from the :make key.
        make: vehicle_data[:make],
        # Assign the model from the :model key.
        model: vehicle_data[:model],
        # Set the engine type to :ev as we are assuming all vehicles are electric vehicles.
        engine: :ev
      })
    end
  end
end
