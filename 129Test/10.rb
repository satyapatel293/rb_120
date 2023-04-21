module RegionalChampMoves
	def jab; end
end

module StateChampMoves
	def hook; end
end

module NationalChampMoves
	def uppercut; end
end

class Boxer; end

class Amateur < Boxer
	include RegionalChampMoves
end

class Novice < Amateur
	include StateChampMoves
end

class Professional < Novice
	include NationalChampMoves
end

boxer = Professional.new
boxer.jab

p Professional.ancestors