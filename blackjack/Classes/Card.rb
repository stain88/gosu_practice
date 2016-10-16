class Card
	attr_accessor :suit, :face, :value, :is_hidden
	def initialize(suit, face)
		@suit = suit
		@face = face
		@value = map_points(face)
		@is_hidden = false
	end

	def map_points(face)
		return face.to_i unless face.to_i == 0

		case face
		when 'A'
			11
		when 'J','Q','K'
			10
		end
	end
end