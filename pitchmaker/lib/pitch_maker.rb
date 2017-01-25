require 'gosu'

class PitchMaker < Gosu::Window

	WINDOW_WIDTH = 1280
	WINDOW_HEIGHT = 960
	TITLE = 'Pitch Maker'

	attr_reader :font

	def initialize
		puts "Launching #{TITLE}"
		super(WINDOW_WIDTH,WINDOW_HEIGHT,false)
		self.caption = TITLE

		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end
end