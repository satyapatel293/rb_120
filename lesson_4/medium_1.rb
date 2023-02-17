=begin
Question 1 

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

This code is correct becasue we are able to call the balance method to read the balance amount and conpare it to 0 
there is no need to append @ or even self.balance in this case 


Question 2 

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

The mistake is not appending self to quanity in the update quanitiy method and slo not allowing a attr writer or attr_accessor method for quantiy 


this fix is to add these 
or just change the qaunity to @quanity 

Question 3 
changing the attr_reader to attr_accessor will also allow us to modify the porducut_name and may not be what we want to do also might be better to make the att accessor private for these propouses 



Question 4 

class Greeting
  def greet(message)
    puts message
  end 
end

class Hello < Greeting
  def hi
    greet('Hello')
  end 
end 

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end 
end 

Question 5 

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s 
    filling_string = filling_type ? filling_type : 'Plain'
    glazing_string = glazing ? " with #{glazing}" : '' 
    "#{filling_string}#{glazing_string}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"




Question 7

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

these should both work the same 


Question 7
light_status to status

=end