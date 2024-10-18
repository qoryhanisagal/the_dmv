# lib/registrant.rb
class Registrant
  attr_reader :name, :age, :license_data

  def initialize(name, age, permit = false) 
    @name = name # The name 
    @age = age
    @permit = permit
    @license_data = { written: false, license: false, renewed: false }
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end
end
# Registrant class needs to be dynamic
# What questions can the method mutation provide?