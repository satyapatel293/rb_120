=begin
Question 5 
  you can find the instance variables of an object by calling 
  Object#instance_variables on that object 
    - will return and array of initalized instance vars 


Question 6 
  to_s will print the string representation of the object 
  which will contain the object class and incoding of object_id 


Question 7 
  the self in this method on line 10 reffered to the instance(object) that called the method

question 8 
  in this method self refferes to the Cat Class

Question 9 
  Bag.new(brown, paper)

=end

class Cat
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bill = Cat.new('bill')
bob = Cat.new('bob')


puts bill.inspect
puts bob