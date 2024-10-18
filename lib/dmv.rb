class Dmv
  # This creates a getter method for the facilities attribute, 
  # allowing the list of facilities to be accessed from outside the class 
  # but not modified directly. This ensures data encapsulation.
  attr_reader :facilities

  # The initialize method is the constructor for the Dmv class.
  # It is called when a new instance of Dmv is created.
  # It initializes an empty array for @facilities, which will later 
  # store the list of facilities managed by the Dmv.
  def initialize
    @facilities = []  # Initializes an empty array to hold facilities.
  end

  # This method allows a facility to be added to the list of facilities.
  # The facility is passed as an argument and appended to the @facilities array.
  # This method ensures that the Dmv object can dynamically manage multiple facilities.
  #
  # @param facility [Object] the facility object that will be added to the @facilities array.
  def add_facility(facility)
    @facilities << facility  # Adds the provided facility to the @facilities array.
  end
end