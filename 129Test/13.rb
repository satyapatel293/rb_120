
class Vehicle
  def drive
    puts "put put put"
  end
end

class TwoWheeled < Vehicle
  def drive
    puts "whirrrrrr"
  end
end

class FourWheeled < Vehicle; end

class Motorcycle < TwoWheeled
  def drive
    puts "braaaaap"
  end
end

class ElectricScooter < TwoWheeled; end
class Car < FourWheeled; end

class Truck < FourWheeled
  def drive
    puts "vroooooom"
  end
end

vehicles = [Motorcycle.new, ElectricScooter.new, Car.new, Truck.new]
vehicles.each { |vehicle| vehicle.drive }
