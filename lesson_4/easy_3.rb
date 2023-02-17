=begin 

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


hello = Hello.new
hello.hi  => 'Hello'


hello = Hello.new
hello.bye ==> no method error


hello = Hello.new
hello.greet ==> missing arugment error


hello = Hello.new
hello.greet("Goodbye") ===> 'Goodbye'


Hello.hi ==> no method error 

-------------------- Question 2


class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi 



Question 4 


=end

class Cat
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end 
end