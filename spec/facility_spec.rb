require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end

    it 'can add vehicle registration' do
      expect(@facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
    end
  end

  describe '#register vehicle' do
    it 'can add registered vehicles to facility' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'can list collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'registers the cruz vehicle with a date' do
      @facility_1.add_service("Vehicle Registration")
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
    end

    it 'can log the date of registration' do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'can log the date of registration in facility 2' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'can administer a written test' do
      @facility_1.add_service("Written Test")
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(@facility_1.administer_written_test(registrant_1)).to eq(true)
    end
  end
end