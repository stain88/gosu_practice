class Ball
	def initialize
		@image = Gosu::Image.new("media/images/ball.png")
		@x = @y = @vel_x = @vel_y = @angle = 0.0
	end

	def warp(x,y)
		@x, @y, = x, y
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, 0.5)
		@vel_y += Gosu::offset_y(@angle, 0.5)
	end

	def move
		@x += @vel_x
		@y += @vel_y

		@vel_y *= -1 if (@y < 0) || (@y + @image.height > Constants::GAME_HEIGHT)
	end

	def draw
		@image.draw(@x, @y, ZOrder::Ball)
	end
end