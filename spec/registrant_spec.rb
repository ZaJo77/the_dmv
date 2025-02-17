require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  it "can initialize a registrant" do
    expect(@registrant_1).to be_an_instance_of(Registrant)
  end

  it "can have a registrant name" do
    expect(@registrant_1.name).to eq("Bruce")
  end

  it "can have a registrant age" do
    expect(@registrant_1.age).to eq(18)
  end

  it "can figure if it has a permit" do
    expect(@registrant_1.permit?).to eq(true)
  end
end
