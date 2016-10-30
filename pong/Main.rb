require 'gosu'
require_relative 'modules/z_order'
require_relative 'modules/constants'
require_relative 'classes/Paddle'

class GameWindow < Gosu::Window
	def initialize
		super Constants::GAME_WIDTH, Constants::GAME_HEIGHT
		self.caption = "Pong"

		@background_image = Gosu::Image.new("media/images/background.png", :tileable => true)

		@player = Paddle.new
		@player.warp(20, 270)

		@enemy = Paddle.new
		@enemy.warp(Constants::GAME_WIDTH - 40, 270)
	end

	def update
		if (Gosu::button_down? Gosu::KbUp) || (Gosu::button_down? Gosu::KbW)
			@player.accelerate(-1)
		end
		if (Gosu::button_down? Gosu::KbDown) || (Gosu::button_down? Gosu::KbS)
			@player.accelerate(1)
		end
		@player.move
	end

	def draw
		@background_image.draw(0,0,ZOrder::Background)
		@player.draw
		@enemy.draw
	end

	def button_down id
		case id
		when Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show