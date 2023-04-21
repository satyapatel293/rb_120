class Shape 
  @@sides = 0 

  def self.sides 
    @@sides 
  end 
end 

class Triangle < Shape 
  @@sides = 3 
end 

p Triangle.sides

class Square < Shape 
  @@sides = 4 
end 


p Triangle.sides 