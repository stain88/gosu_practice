require 'gosu'
require_relative 'Modules/zorder'
require_relative 'Classes/Player'
require_relative 'Classes/Deck'
require_relative 'Classes/Card'

class GameWindow < Gosu::Window
	def initialize
		super 860, 640
		self.caption = "Blackjack"

		@background_image = Gosu::Image.new("Images/felt.png", :tileable => true)
		@title = Gosu::Font.new(50)
		@subtitle = Gosu::Font.new(30)
		@money_message = Gosu::Font.new(25)
		@dealer_message = Gosu::Font.new(40)
		@player_message = Gosu::Font.new(40)

		@player = Player.new(false, "test")
		@dealer = Player.new(true)

		@deck = Deck.new(5)
		@deck_image = Gosu::Image.new("Images/back.png")
	end

	def new_game
		@game_running = true
	end

	def title_screen
		@background_image.draw(0,0,ZOrder::Background, 1, 1, 0xaa_ffffff)
		@title.draw("Welcome to Blackjack", 190, 150, ZOrder::UI, 1, 1, 0xff_ffff00)
		@subtitle.draw("Press enter to start game!", 250, 320, ZOrder::UI, 1, 1, 0xff_ff0000)
	end

	def play_game
		@background_image.draw(0,0,ZOrder::Background, 1, 1, 0xaa_ffffff)
		@money_message.draw("Money: £#{@player.money}", 10, 10, ZOrder::UI, 1, 1, 0xff_ffff00)

		@deck_image.draw(30,200,ZOrder::Cards, 0.6, 0.6)
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
			play_game
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