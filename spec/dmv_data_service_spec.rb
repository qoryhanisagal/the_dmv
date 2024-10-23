require 'spec_helper'

RSpec.describe DmvDataService do
  # Set up a new instance of DmvDataService before each test
  before(:each) do
    @dds = DmvDataService.new
  end

  # Test to check if DmvDataService can be initialized
  describe '#initialize' do
    it 'can initialize' do
      expect(@dds).to be_an_instance_of(DmvDataService)  # Expect @dds to be an instance of DmvDataService
    end
  end

  # Test the load_data method, which loads data from a specific source URL
  describe '#load_data' do
    it 'can load data from a given source' do
      source = 'https://data.colorado.gov/resource/dsw3-mrn4.json'  # Example source URL for Colorado DMV office locations
      data_response = @dds.load_data(source)  # Load the data from the specified source
      expect(data_response).to be_an_instance_of(Array)  # Ensure the data returned is an array
      expect(data_response.size).to be_an(Integer)  # Ensure the array contains some records
    end
  end

  # Test to ensure that the Washington EV registration data can be fetched
  describe '#wa_ev_registrations' do
  it 'can load washington ev registration data' do
    binding.pry  # Add here to inspect what @dds.wa_ev_registrations returns

    expect(@dds.wa_ev_registrations.size).to be_an(Integer)
  end
end


  # Test to ensure that the Colorado DMV office locations can be fetched
  describe '#co_dmv_office_locations' do
    it 'can load colorado dmv office locations' do
      expect(@dds.co_dmv_office_locations.size).to be_an(Integer)  # Ensure the data is an array and has records
    end
  end

  # Test to ensure that the New York DMV office locations can be fetched
  describe '#ny_dmv_office_locations' do
    it 'can load new york dmv office locations' do
      expect(@dds.ny_dmv_office_locations.size).to be_an(Integer)  # Ensure the data is an array and has records
    end
  end

  # Test to ensure that the Missouri DMV office locations can be fetched
  describe '#mo_dmv_office_locations' do
    it 'can load missouri dmv office locations' do
      expect(@dds.mo_dmv_office_locations.size).to be_an(Integer)  # Ensure the data is an array and has records
    end
  end
end
