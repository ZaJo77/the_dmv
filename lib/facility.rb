class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
      @name = facility_details[:name]
      @address = facility_details[:address]
      @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      if vehicle.electric_vehicle?
        @collected_fees += 200
      elsif vehicle.antique?
        @collected_fees += 25
      else
        @collected_fees += 100
      end
    end
    @registered_vehicles
  end

  def administer_written_test(registrant)
    @registrant = true
  end
end