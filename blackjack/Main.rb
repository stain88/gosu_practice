require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super 860, 640
	end

	def update

	end

	def draw

	end

	def button_down id
		if id == Gosu::KbEscape
			close
		end
	end
end

window = GameWindow.new
window.show