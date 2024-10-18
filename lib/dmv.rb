class Dmv
  attr_reader :facilities  # Getter method for facilities

  def initialize
    @facilities = []  # Initialize an empty array for storing facilities
  end

  # This method adds a facility to the @facilities array
  def add_facility(facility)
    @facilities << facility  # Add the given facility to the @facilities array
  end

  # This method returns a list of facilities that offer the specified service.
  # It iterates over the @facilities array and selects facilities that include the requested service.
  #
  # @param service [String] the name of the service to search for in the facilities.
  # @return [Array] an array of facilities that offer the specified service.
  def facilities_offering_service(service)
    @facilities.select do |facility|
      facility.services.include?(service)  # Check if the facility offers the specified service
    end
  end
end