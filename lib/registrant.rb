class Registrant
  attr_reader :name

  def initialize(name, age, permit=false)
    @name = name
    @age = age
    @permit = permit
  end
end