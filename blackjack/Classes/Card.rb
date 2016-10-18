class Card
	attr_accessor :suit, :face, :value, :is_hidden

	def initialize(suit, face, is_hidden=false)
		@suit = suit
		@face = face
		@is_hidden = is_hidden
		@value = map_points(face)
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