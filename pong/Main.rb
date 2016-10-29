require 'gosu'
require_relative 'modules/z_order'

class GameWindow < Gosu::Window
	def initialize
		super 860,640
		self.caption = "Pong"

		@background_image = Gosu::Image.new("media/images/background.png", :tileable => true)
	end

	def update

	end

	def draw
		@background_image.draw(0,0,ZOrder::Background)
	end

	def button_down id
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show