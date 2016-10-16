class Player
	attr_accessor :name, :is_dealer, :hand, :money, :bet

	def initialize(is_dealer, *name)
		@is_dealer = is_dealer
		@hand = []
		@name = is_dealer ? "Dealer" : name[0]
		@money = 100
	end

	def current_score
		total = 0

		hand.each do |card|
			total += card.value
		end

		hand.select { |card| card.face == "A" }.count.times do
			total -= 10 if total > 21
		end
		total
	end

	def reveal_cards
		hand.each { |card| card.is_hidden = false }
	end
end