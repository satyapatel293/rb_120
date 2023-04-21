class Movie
  attr_accessor :title, :tagline

  def initialize(title, tagline)
    @title = title
    @tagline = tagline
  end

  def format_movie_info
    self.title = title.capitalize
    self.tagline = tagline.capitalize
    "#{title}: #{tagline}"
  end
end

ghostbusters = Movie.new('ghostbusters', 'who you gonna call?')

p ghostbusters.format_movie_info # Ghostbusters: Who you gonna call?
p ghostbusters.title # Ghostbusters
p ghostbusters.tagline # Who you gonna call?