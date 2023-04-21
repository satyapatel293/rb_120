
class SorcerySchool
  def initialize
    students = []
  end 

  def add_student(student)
    students << student
  end 

  @@spells = ["fireball", "earthquake", "wall of water", "lightning bolt"]

  def self.assign_spell
    return 'TBD' if @@spells.empty?
    assigment = @@spells.sample
    @@spells.delete(assigment)
    assigment
  end 
end

module Stoppable 
  def time_stop
  end
end 

module Alterable
  def mirage 
  end 
end 

class SorceryStudent
  def initialize(range)
    @magical_energy = calc_magical_energy(range)
    @unique_spell = SorcerySchool.assign_spell
  end

  def to_s 
    <<-MSGR
    ============================
    School of Sorcery: #{self.class}  
    Magical Energy: #{magical_energy}
    Unique Spell: #{unique_spell}
    Artifact: #{artifact}
    Robe Color: #{robe_color}
    ============================
    MSGR
  end

  private 
  attr_reader :magical_energy, :unique_spell, :artifact, :robe_color

  def calc_magical_energy(range)
    range.to_a.sample
  end 
end 

class Illusionist < SorceryStudent
  include Alterable
  def initialize
    super((100..200))
    @artifact = "crystal ball"
    @robe_color = 'purple'
  end
end

class Enchanter < Illusionist
  include Alterable

  def initialize
    @magical_energy = calc_magical_energy((150..250))
    @unique_spell = SorcerySchool.assign_spell
    @artifact = "crystal ball"
    @robe_color = 'gold'
  end
end 

class Necromancer < SorceryStudent
  include Stoppable

  def initialize
    super((75..175))
    @artifact = "wooden staff"
    @robe_color = 'black'
  end

  def create_zombie
  end 
end 

class Conjurer < SorceryStudent
  include Alterable
  include Stoppable

  def initialize
    super((100..200))
    @artifact = "silver wand"
    @robe_color = 'green'
  end
end 


