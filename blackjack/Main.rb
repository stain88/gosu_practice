require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super 860, 640
		self.caption = "Blackjack"

		@background_image = Gosu::Image.new("Images/felt.png", :tileable => true)
	end

	def new_game
		@game_running = true
	end

	def title_screen
		@background_image.draw(0,0,0)
		welcome = Gosu::Image.from_text(self, "Welcome to Blackjack", "sans-serif", 50, 2, 500, :center)
		welcome.draw(190, 150, 1)
		start = Gosu::Image.from_text(self, "Press enter to start game!", "sans-serif", 30, 2, 400, :center)
		start.draw(250, 320, 1)
	end

	def game_play
		@background_image.draw(0,0,0)
		message = Gosu::Image.from_text(self, "playing game", "sans-serif", 30, 2, 300, :center)
		message.draw(250, 300, 1)
	end

	def update
		if button_down? Gosu::KbReturn
			if !@game_running
				new_game
			end
		end
	end

	def draw
		if !@game_running
			title_screen
		else
			game_play
		end
	end

	def button_down id
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show