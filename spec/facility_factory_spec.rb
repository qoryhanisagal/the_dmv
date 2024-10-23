# Required files for testing
require 'spec_helper'         # Load RSpec configuration and helpers
require './lib/facility_factory'  # Load the FacilityFactory class
require './lib/facility'          # Load the Facility class

# Describe the test suite for the FacilityFactory class
RSpec.describe FacilityFactory do
  # Before each test, set up a new instance of FacilityFactory and test data
  before(:each) do
    @factory = FacilityFactory.new  # Create an instance of FacilityFactory

    # Sample data representing a DMV facility. This is a hash that simulates data from an external source.
    @facility_data = [
      {
        dmv_office: 'DMV Tremont Branch',    # Facility name
        address_li: '2855 Tremont Place',    # First line of the address
        address__1: 'Suite 118',             # Second line of the address (suite number)
        city: 'Denver',                     # City
        state: 'CO',                        # State
        zip: '80205',                       # ZIP code
        phone: '(720) 865-4600'             # Phone number
      }
    ]
  end

  # Describe the test for the #create_facilities method in FacilityFactory
  describe '#create_facilities' do
    # Test that the create_facilities method works as expected
    it 'creates Facility objects from data' do
      # Call the create_facilities method with the sample facility data
      facilities = @factory.create_facilities(@facility_data)

      # Test: Ensure the result is an array
      expect(facilities).to be_an(Array)
      
      # Test: Ensure the first element in the array is an instance of the Facility class
      expect(facilities.first).to be_a(Facility)
      
      # Test: Check that the Facility name is correctly assigned
      expect(facilities.first.name).to eq('DMV Tremont Branch')
      
      # Test: Check that the Facility address is correctly concatenated and assigned
      expect(facilities.first.address).to eq('2855 Tremont Place Suite 118, Denver, CO 80205')
      
      # Test: Check that the Facility phone number is correctly assigned
      expect(facilities.first.phone).to eq('(720) 865-4600')
    end
  end
end
