# spec/registrant_spec.rb
require 'spec_helper'

RSpec.describe Registrant do
  # Test initialization with name, age, and permit
  it 'creates a registrant with a name, age, and permit' do
    registrant_1 = Registrant.new('Bruce', 18, true)  # Registrant with a permit
    registrant_2 = Registrant.new('Penny', 15)        # Registrant without a permit

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
end