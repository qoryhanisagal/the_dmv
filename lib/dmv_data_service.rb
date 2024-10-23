require 'faraday'
require 'json'

class DmvDataService
  # Method to load data from a given URL source
  # @param source [String] the URL to fetch data from
  # @return [Hash] the parsed JSON data with symbolized keys
  def load_data(source)
    response = Faraday.get(source)  # Make HTTP GET request to the source URL
    JSON.parse(response.body, symbolize_names: true)  # Parse the JSON response and return it as a hash with symbolized keys
  end

  # Method to get Washington state electric vehicle registrations
  # @return [Array<Hash>] an array of hashes containing electric vehicle registration data
  def wa_ev_registrations
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json')  # Cache the result to avoid fetching data multiple times
  end

  # Method to get Colorado DMV office locations
  # @return [Array<Hash>] an array of hashes containing Colorado DMV office location data
  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data('https://data.colorado.gov/resource/dsw3-mrn4.json')  # Cache the result to avoid fetching data multiple times
  end

  # Method to get New York DMV office locations
  # @return [Array<Hash>] an array of hashes containing New York DMV office location data
  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')  # Cache the result to avoid fetching data multiple times
  end

  # Method to get Missouri DMV office locations
  # @return [Array<Hash>] an array of hashes containing Missouri DMV office location data
  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')  # Cache the result to avoid fetching data multiple times
  end
end
