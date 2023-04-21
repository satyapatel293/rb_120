class Car
  @@starts = 0
  
  def start
    @@starts += 1 
    puts "Vroom"
  end

  def self.total_starts
    @@starts
  end 
end

car = Car.new

car.start
p Car.total_starts # 1
car.start
p Car.total_starts # 2
car.start
p Car.total_starts # 3