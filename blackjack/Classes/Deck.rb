class Deck
	attr_accessor :cards

	def initialize(number_of_decks=1)
		@cards = []

		number_of_decks.times do
			['H','S','D','C'].each do |suit|
				['2','3','4','5','6','7','8','9','10','J','Q','K','A'].each do |face|
					@cards << Card.new(suit, face)
				end
			end
		end
		shuffle
	end

	def shuffle
		7.times do @cards.shuffle! end
	end

	def deal_card
		@cards.pop
	end
end