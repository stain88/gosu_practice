require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super 860, 640
		self.caption = "Blackjack"

		@background_image = Gosu::Image.new("Images/felt.png", :tileable => true)
	end

	def update

	end

	def draw
		@background_image.draw(0,0,0)
	end

	def button_down id
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show