module Swimable 
  def swimming 
    puts "I'm swimming!!"
  end 
end 

class Animal 
end 

class Person < Animal
  include Swimable
end

class Dog < Animal 
end

class Bulldog < Dog 
  include Swimable
end 

class Monster 
  include Swimable
end 

swimmers = [Monster.new, Bulldog.new, Person.new]
swimmers.each do|swimmer| 
  puts "The #{swimmer.class} says:"
  swimmer.swimming
end

# This code outputs 
# The Monster says:
# I'm swimming!!
# The Bulldog says:
# I'm swimming!!
# The Person says:
# I'm swimming!!



module Toolbox
  def self.hammer 
    'Hammer'
  end 

  def self.screwdriver
    'Screwdriver'
  end 
end 

class Ninja 
end 

class Fighter
  def 
end 

ninja = Ninja.new


puts "The #{ninja.class} is walking along the game"
puts "The #{ninja.class} picks up the #{Toolbox.hammer} from the floor!"
