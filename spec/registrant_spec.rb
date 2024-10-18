# spec/registrant_spec.rb
require 'spec_helper'

RSpec.describe Registrant do
  # Test initialization with name, age, and permit
  it 'creates a registrant with a name, age, and permit' do
    registrant_1 = Registrant.new('Bruce', 18, true)  # Registrant with a permit
    registrant_2 = Registrant.new('Penny', 15)        # Registrant without a permit
    binding.pry
    # Test the attributes of the first registrant
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_1.license_data).to eq({ written: false, license: false, renewed: false })

    # Test the attributes of the second registrant
    expect(registrant_2.name).to eq('Penny')
    expect(registrant_2.age).to eq(15)
    expect(registrant_2.permit?).to eq(false)
    expect(registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
  end

  # Test if a registrant can earn a permit
  it 'allows a registrant to earn a permit' do
    registrant_2 = Registrant.new('Penny', 15)  # Initialize a registrant without a permit

    # Ensure initially Penny doesn't have a permit
    expect(registrant_2.permit?).to eq(false)
    
    # Penny earns a permit
    registrant_2.earn_permit

    # Test if the permit status is updated
    expect(registrant_2.permit?).to eq(true)
  end

  # Edge Case 1: Registrants of any age can earn a permit
  it 'allows registrants of any age to earn a permit' do
    registrant_young = Registrant.new('Baby Bruce', 5)
    registrant_old = Registrant.new('Grandpa Joe', 85)

    # Initially, neither should have a permit
    expect(registrant_young.permit?).to eq(false)
    expect(registrant_old.permit?).to eq(false)

    # Both earn a permit
    registrant_young.earn_permit
    registrant_old.earn_permit

    # Both should now have a permit
    expect(registrant_young.permit?).to eq(true)
    expect(registrant_old.permit?).to eq(true)
  end

  # Edge Case 2: Permit defaults to false
  it 'defaults permit to false if not provided' do
    registrant_3 = Registrant.new('Charlie', 30)

    # Permit should be false by default
    expect(registrant_3.permit?).to eq(false)
  end

  # Edge Case 3: Initialize with a permit if provided
  it 'can initialize with a permit if provided' do
    registrant_1 = Registrant.new('Bruce', 18, true)

    # Permit should be true because it was provided as true
    expect(registrant_1.permit?).to eq(true)
  end
end