class IceCreamScoop
  @@total_scoops = 0

  def initialize(flavor, double=false)
    @flavor = flavor
    @double = double
    @@total_scoops += 1
    update_total_scoops
  end

  def make_it_a_double_scoop
    self.double = true
    update_total_scoops
  end

  def self.total_scoops
    @@total_scoops
  end

  private

  attr_accessor :double

  def update_total_scoops
    @@total_scoops += 1 if double == true
  end
end

my_scoops = IceCreamScoop.new('strawberry')
my_scoops.make_it_a_double_scoop
p IceCreamScoop.total_scoops # 2