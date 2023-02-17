=begin
Quesiton 1 


Question 2

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

#this will print the choices from the choices method in the RoadTrip class 
# this is becuase the look up chain will alway start at the calling object 


Question 3

Orange.ancestors

Orange 
Tate 
Object 
Kernel 
Basic Object 

Question 4 
add attr_acessor :type


Question 5 
1 is an local variable 
2 is a instance variable
3 is a class varaible 
we can tell by the @ and @@ in front of the 2nd and 3rd variables what they are 


Question 6 
  Television::manufacturer is a class method 
  You can tell becasue self if prepended to the def

  you can call a class method like so Television.manufacturer 


Question 7 
  @@cats_count is sa class variable that will increment by 1 each time an instance of the 
  cat class is created 

  bob = Cat.new('tabby')
  p Cat.cats_count
  bill = Cat.new('egyptian')
  p Cat.cats_count


Quesiton 10
Benifits of using OOP in Ruby 
Creating objects allows programmers to think more abstractly about the code they are writing.
Objects are represented by nouns so are easier to conceptualize.
It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
It allows us to easily give functionality to different parts of an application without duplication.
We can build applications faster as we can reuse pre-written code.
As the software becomes more complex this complexity can be more easily managed.

=end