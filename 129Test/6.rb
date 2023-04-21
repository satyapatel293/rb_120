class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def ==(other)
    author == other.author
  end 
end

kindred = Book.new('Kindred', 'Octavia E. Butler')
fledgling = Book.new('Fledgling', 'Octavia E. Butler')
imposter = Book.new('Imposter', 'Philip K. Dick')
minority_report = Book.new('Minority Report', "Philip K. Dick")

p kindred == fledgling        # should output true
p fledgling == imposter       # should output false
p imposter == minority_report # should output true