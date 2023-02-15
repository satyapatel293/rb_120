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


=end