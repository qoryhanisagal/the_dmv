require 'spec_helper'
require './lib/facility'
require './lib/registrant'
require './lib/vehicle'

RSpec.describe Facility do
  # Setup facility and vehicles before each test
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end

  # Test for facility initialization
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  # Test for adding services to the facility
  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  # Test for adding vehicle registration service
  describe '#vehicle registration' do
    it 'can add vehicle registration service' do
      expect(@facility.services).to eq([])

      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq(['Vehicle Registration'])
    end

    # Test for registering a vehicle and charging appropriate fees
    it 'can register a vehicle and charge appropriate fees' do
      @facility.add_service('Vehicle Registration')

      # Register the first vehicle (Cruz) and check its registration status
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to be_a(Date)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.collected_fees).to eq(100)

      # Register the second vehicle (Camaro) and check its registration status
      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles).to include(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility.collected_fees).to eq(125)

      # Register the third vehicle (Bolt) and check its registration status
      @facility.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility.collected_fees).to eq(325)
    end
  end

  # Testing written test functionality
  describe '#administer_written_test' do
    it 'administers a written test to eligible registrants' do
      @facility.add_service('Written Test')  # Add the written test service

      # Initialize registrants
      registrant_1 = Registrant.new('John', 17, true)  # Registrant with a permit
      registrant_2 = Registrant.new('Jane', 15, true)  # Registrant under age 16
      registrant_3 = Registrant.new('Bob', 17, false)  # Registrant without a permit

      # Test that registrant_1 can take the written test
      expect(@facility.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data[:written]).to eq(true)

      # Test that registrant_2 cannot take the written test due to age
      expect(@facility.administer_written_test(registrant_2)).to eq(false)
      expect(registrant_2.license_data[:written]).to eq(false)

      # Test that registrant_3 cannot take the written test due to lack of permit
      expect(@facility.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data[:written]).to eq(false)
    end
  end

  # Testing road test functionality
  describe '#administer_road_test' do
    it 'administers a road test to eligible registrants' do
      # Add the road test service to the facility
      @facility.add_service('Road Test')
      @facility.add_service('Written Test')

      # Initialize registrants
      registrant_1 = Registrant.new('John', 17, true)  # Registrant with a permit and written test passed
      registrant_3 = Registrant.new('Bob', 17, false)  # Registrant without a permit

      # Pass written test for registrant_1
      @facility.administer_written_test(registrant_1)

      # Test that registrant_1 can take the road test
      expect(@facility.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data[:license]).to eq(true)

      # Test that registrant_3 cannot take the road test due to failing written test
      expect(@facility.administer_road_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data[:license]).to eq(false)
    end

    it 'does not administer road test if service is not offered' do
      registrant_1 = Registrant.new('John', 17, true)  # Registrant with a permit
      @facility.add_service('Written Test')  # Only add the written test, no road test

      # Pass written test
      @facility.administer_written_test(registrant_1)

      # Try to administer road test (should fail since the service is not offered)
      expect(@facility.administer_road_test(registrant_1)).to eq(false)
      expect(registrant_1.license_data[:license]).to eq(false)
    end
  end

# Testing license renewal functionality
describe '#renew_drivers_license' do
  it 'renews a driver’s license if the registrant has a license' do
    # Add the renew license service to the facility
    @facility.add_service('Renew License')

    # Initialize registrants
    registrant_1 = Registrant.new('John', 17, true)  # Registrant with a permit
    registrant_2 = Registrant.new('Jane', 15, true)  # Registrant without a license

    # Simulate the process of passing the written and road tests for registrant_1
    @facility.add_service('Written Test')
    @facility.add_service('Road Test')
    @facility.administer_written_test(registrant_1)
    @facility.administer_road_test(registrant_1)

    # Test that registrant_1 can renew their license
    expect(@facility.renew_drivers_license(registrant_1)).to eq(true)
    expect(registrant_1.license_data[:renewed]).to eq(true)

    # Test that registrant_2 cannot renew their license since they do not have one
    expect(@facility.renew_drivers_license(registrant_2)).to eq(false)
    expect(registrant_2.license_data[:renewed]).to eq(false)
  end

  it 'does not renew license if service is not offered' do
    registrant_1 = Registrant.new('John', 17, true)  # Registrant with a permit

    # Simulate passing both tests
    @facility.add_service('Written Test')
    @facility.add_service('Road Test')
    @facility.administer_written_test(registrant_1)
    @facility.administer_road_test(registrant_1)

    # Try to renew license without adding the renew service
    expect(@facility.renew_drivers_license(registrant_1)).to eq(false)
    expect(registrant_1.license_data[:renewed]).to eq(false)
  end
end


  # Edge Case 1: Test registering a vehicle when the service is not offered
  it 'does not register a vehicle if the service is not offered' do
    expect(@facility.registered_vehicles).to eq([])  # No vehicles registered yet

    @facility.register_vehicle(@cruz)  # Trying to register Cruz without offering the service
    expect(@facility.registered_vehicles).to eq([])  # No vehicles should be registered
    expect(@facility.collected_fees).to eq(0)        # No fees should be collected
  end

  # Edge Case 2: Test registering a vehicle without an engine type
  it 'handles registration of vehicles with missing engine type' do
    unknown_vehicle = Vehicle.new({vin: 'unknownvin', year: 2010, make: 'Unknown', model: 'Unknown'})
    @facility.add_service('Vehicle Registration')

    @facility.register_vehicle(unknown_vehicle)
    expect(unknown_vehicle.plate_type).to eq(:regular)  # Default to regular plate type
    expect(@facility.collected_fees).to eq(100)         # Charge regular fee
  end

  # Edge Case 3: Test registering multiple vehicles and total fees
  it 'registers multiple vehicles and tracks total fees accurately' do
    @facility.add_service('Vehicle Registration')
    
    # Register the first vehicle (Cruz)
    @facility.register_vehicle(@cruz)  # Regular vehicle, should add 100 to fees
    
    # Register the second vehicle (Bolt)
    @facility.register_vehicle(@bolt)  # EV vehicle, should add 200 to fees
    
    # Register the third vehicle (Camaro)
    @facility.register_vehicle(@camaro)  # Antique vehicle, should add 25 to fees

    expect(@facility.registered_vehicles).to include(@cruz, @bolt, @camaro)
    expect(@facility.collected_fees).to eq(325)  # 100 (cruz) + 200 (bolt) + 25 (camaro)= 325
  end
end