class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility, address, phone)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find do |facility|
      facility.services.include?(service)
    end
  end
end
