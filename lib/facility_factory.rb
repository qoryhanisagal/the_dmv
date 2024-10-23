# The FacilityFactory class is responsible for creating instances of Facility objects from data.
class FacilityFactory
  # Method: create_facilities
  # This method takes an array of data (typically hashes) representing facilities.
  # It maps over the data, creating and returning an array of Facility objects based on the data.
  #
  # Parameters:
  # - data: An array of hashes. Each hash contains information about a facility (name, address, phone, etc.).
  #
  # Returns:
  # - An array of Facility objects.
  def create_facilities(data)
    # Iterate over each entry (facility_data) in the provided data array
    data.map do |facility_data|
      # Create and return a new instance of Facility using the data from the current hash (facility_data).
      Facility.new({
        # Assign the facility name using the :dmv_office key from the data.
        name: facility_data[:dmv_office],
        # Concatenate multiple address fields (address_li, address__1, city, state, zip) into one string.
        address: "#{facility_data[:address_li]} #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip]}",
        # Assign the phone number from the :phone key in the data.
        phone: facility_data[:phone]
      })
    end
  end
end
