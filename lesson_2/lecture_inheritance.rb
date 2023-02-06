=begin
1. 

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end 
end 

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

fido = Bulldog.new
puts fido.speak
puts fido.swim

=end 

# 2.

class Pet 
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end 

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet 
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end 
end 


pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
# pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
# kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"

=begin
3.
               Pet 
              +run 
              +jump
               |
    Cat________|______________Dog
  +speak                     +speak   
                             +swim
                             +fetch 
                               |
                            BullDog
                             +swim

4. A method look up path is the way in which ruby looks for a method when it is called. So it will first look in the class then the mixins then the superclasses with they methods then mixins (mixinis will be searched in the reverse order in which they are placed in the program)
this is improtant becuasae you can overide superclass methods (behavoirs) with methods that are names the same thing in a subclass
=end 