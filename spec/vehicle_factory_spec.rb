# spec/vehicle_factory_spec.rb

require 'spec_helper'
require './lib/dmv_data_service'
require './lib/vehicle_factory'  # Require the VehicleFactory class
require './lib/vehicle'          # Require the Vehicle class

# RSpec describe block for VehicleFactory class
RSpec.describe VehicleFactory do
  # Setup the VehicleFactory instance and sample vehicle data before each test
  before(:each) do
    @factory = VehicleFactory.new  # Initialize the VehicleFactory instance

    # Sample data representing vehicles (this mimics what would be returned from the API)
    @vehicle_data = [
      {
        vin_1_10: 'JTDKN3DP8D',      # VIN for the first vehicle
        model_year: '2013',          # Model year for the first vehicle
        make: 'TOYOTA',               # Manufacturer for the first vehicle
        model: 'Prius Plug-in'        # Model for the first vehicle
      },
      {
        vin_1_10: '1G1RD6E47D',       # VIN for the second vehicle
        model_year: '2013',          # Model year for the second vehicle
        make: 'CHEVROLET',            # Manufacturer for the second vehicle
        model: 'Volt'                 # Model for the second vehicle
      }
    ]
  end

  # Test for VehicleFactory initialization
  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(VehicleFactory)  # Check if @factory is an instance of VehicleFactory
    end
  end

  # Test for creating vehicles from data
  describe '#create_vehicles' do
    it 'can create vehicles from data' do
      # Use the factory to create vehicles from the @vehicle_data
      vehicles = @factory.create_vehicles(@vehicle_data)

      expect(vehicles).to be_an(Array)         # Check if the result is an array
      expect(vehicles.length).to eq(2)         # Check if it creates 2 Vehicle objects
      expect(vehicles.first).to be_an_instance_of(Vehicle)  # Check if the first object is a Vehicle

      # Test the attributes of the first vehicle
      expect(vehicles.first.vin).to eq('JTDKN3DP8D')        # Check if the VIN is correct
      expect(vehicles.first.year).to eq('2013')             # Check if the year is correct
      expect(vehicles.first.make).to eq('TOYOTA')           # Check if the make is correct
      expect(vehicles.first.model).to eq('Prius Plug-in')   # Check if the model is correct
      expect(vehicles.first.engine).to eq(:ev)              # Check if the engine is set to :ev

      # Test the attributes of the second vehicle
      expect(vehicles.last.vin).to eq('1G1RD6E47D')         # Check if the VIN is correct
      expect(vehicles.last.year).to eq('2013')              # Check if the year is correct
      expect(vehicles.last.make).to eq('CHEVROLET')         # Check if the make is correct
      expect(vehicles.last.model).to eq('Volt')             # Check if the model is correct
      expect(vehicles.last.engine).to eq(:ev)               # Check if the engine is set to :ev
    end
  end

  # Integration test for using DmvDataService and VehicleFactory together
  describe 'Integration with DmvDataService' do
    it 'can create vehicles from external data' do
      # Initialize DmvDataService to fetch real-world data
      dmv_data_service = DmvDataService.new

      # Fetch Washington state EV registration data
      ev_data = dmv_data_service.wa_ev_registrations

      # Use VehicleFactory to create vehicle objects from the external data
      vehicles = @factory.create_vehicles(ev_data)

      expect(vehicles).to be_an(Array)  # Ensure it returns an array of vehicles
      expect(vehicles.first).to be_a(Vehicle)  # Ensure the first item is a Vehicle object
      expect(vehicles.first.engine).to eq(:ev)  # Check that the engine type is set to EV
      expect(vehicles.size).to eq(ev_data.size)  # Check that the number of vehicles matches the data
    end
  end
end