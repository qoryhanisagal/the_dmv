require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#vehicle registration' do
    it 'can add vehicle registration service' do
      expect(@facility.services).to eq([])

      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq(['Vehicle Registration'])
    end

    it 'can register a vehicle and charge appropriate fees' do
      @facility.add_service('Vehicle Registration')

      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to be_a(Date)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.collected_fees).to eq(100)

      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles).to include(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility.collected_fees).to eq(125)

      @facility.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility.collected_fees).to eq(325)
    end
  end

  # Edge Case 1: Test registering a vehicle when the service is not offered
  it 'does not register a vehicle if the service is not offered' do
    expect(@facility.registered_vehicles).to eq([])  # No vehicles registered yet

    binding.pry  # Pause here to inspect before registration attempt

    @facility.register_vehicle(@cruz)                # Trying to register Cruz without offering the service
    expect(@facility.registered_vehicles).to eq([])  # No vehicles should be registered
    expect(@facility.collected_fees).to eq(0)        # No fees should be collected
  end

  # Edge Case 2: Test registering a vehicle without an engine type
  it 'handles registration of vehicles with missing engine type' do
    unknown_vehicle = Vehicle.new({vin: 'unknownvin', year: 2010, make: 'Unknown', model: 'Unknown'})
    @facility.add_service('Vehicle Registration')

    binding.pry  # Pause here to inspect the unknown vehicle

    @facility.register_vehicle(unknown_vehicle)
    expect(unknown_vehicle.plate_type).to eq(:regular)  # Default to regular plate type
    expect(@facility.collected_fees).to eq(100)         # Charge regular fee
  end

  # Edge Case 3: Test registering multiple vehicles and total fees
  it 'registers multiple vehicles and tracks total fees accurately' do
    @facility.add_service('Vehicle Registration')
    @facility.register_vehicle(@cruz) # Regular vehicle, should add 100 to fees

    binding.pry  # Pause here to check total fees after the first registration
    
    @facility.register_vehicle(@bolt) # EV vehicle, should add 200 to fees
    @facility.register_vehicle(@camaro) # Antique vehicle, should add 25 to fees

    expect(@facility.registered_vehicles).to include(@cruz, @bolt, @camaro)
    expect(@facility.collected_fees).to eq(325)  # 100 (cruz) + 200 (bolt) + 25 (camaro)= 325
  end
end