require 'gosu'
require_relative 'modules/z_order'
require_relative 'classes/paddle'

class GameWindow < Gosu::Window
	def initialize
		super 860,640
		self.caption = "Pong"

		@background_image = Gosu::Image.new("media/images/background.png", :tileable => true)

		@player = Paddle.new
		@player.warp(20, 270)
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
	end

	def button_down id
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show