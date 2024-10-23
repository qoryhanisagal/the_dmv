class VehicleFactory
  # The create_vehicles method takes in an array of vehicle data hashes
  # It maps over the data to create new Vehicle objects from the provided data
  def create_vehicles(data)
    # Iterate over each entry in the data array
    data.map do |vehicle_data|
      # For each vehicle_data hash, create a new Vehicle object with specific attributes
      Vehicle.new({
        vin: vehicle_data[:vin_1_10],    # Extract the VIN (first 10 characters) from the vehicle data
        year: vehicle_data[:model_year], # Extract the vehicle's model year
        make: vehicle_data[:make],       # Extract the make of the vehicle (e.g., Toyota, Chevrolet)
        model: vehicle_data[:model],     # Extract the model of the vehicle (e.g., Prius, Bolt)
        engine: :ev                      # Since this dataset is for electric vehicles, assume all engines are electric (:ev)
      })
    end
  end
end
