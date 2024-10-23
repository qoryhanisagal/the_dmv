require 'faraday'  # Faraday is used for making HTTP requests
require 'json'     # JSON is used for parsing the JSON responses

class DmvDataService
  # This method takes a source URL, makes an HTTP GET request to that source, 
  # and parses the response body into a Ruby hash using JSON.
  def load_data(source)
    response = Faraday.get(source)  # Make HTTP GET request to the source URL

    binding.pry  # Add here to inspect the response or parsed data
    
    JSON.parse(response.body, symbolize_names: true)  # Parse the JSON response and return it as a hash with symbolized keys
  end

  # Method to load Washington State EV registrations.
  # Uses memoization (@wa_ev_registrations) to cache the data after the first API request.
  def wa_ev_registrations
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json')
  end

  # Method to load Colorado DMV office locations.
  # Uses memoization (@co_dmv_office_locations) to avoid multiple API requests.
  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data('https://data.colorado.gov/resource/dsw3-mrn4.json')
  end

  # Method to load New York DMV office locations.
  # The data is fetched from an external API and cached using memoization.
  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')
  end

  # Method to load Missouri DMV office locations.
  # Memoization ensures the data is only fetched once and reused in future calls.
  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')
  end
end