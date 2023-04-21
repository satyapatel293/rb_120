
module Round
  def is_round?
    puts "Yes, I'm round"
  end
end

class Shape
  def description
    puts "I'm a #{self.class}"
  end

  def next_ancestor
    puts self.class.ancestors[1]
  end
end

class Rectangle < Shape
end
class Square < Rectangle
end
class Circle < Shape
	include Round
end

rectangle = Rectangle.new
square = Square.new
circle = Circle.new

rectangle.description # I'm a Rectangle
square.description # I'm a Square
circle.description # I'm a Circle

rectangle.next_ancestor # Shape
square.next_ancestor # Rectangle
circle.next_ancestor # Round

rectangle.is_round? # NoMethodError
square.is_round? # NoMethodError
circle.is_round? # Yes I'm round