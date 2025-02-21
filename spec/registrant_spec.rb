require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  it "can initialize a registrant" do
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2).to be_an_instance_of(Registrant)
  end

  it "can have a registrant name" do
    expect(@registrant_1.name).to eq("Bruce")
    expect(@registrant_2.name).to eq("Penny")
  end

  it "can have a registrant age" do
    expect(@registrant_1.age).to eq(18)
    expect(@registrant_2.age).to eq(15)
  end

  it "can figure if it has a permit" do
    expect(@registrant_1.permit?).to eq(true)
    expect(@registrant_2.permit?).to eq(false)
  end

  it "can give license date" do
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it "can earn permit" do
    expect(@registrant_2.permit?).to eq(false)
    @registrant_2.earn_permit
    expect(@registrant_2.permit?).to eq(true)
  end
end
