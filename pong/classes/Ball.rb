class Ball
	def initialize
		@image = Gosu::Image.new("media/images/ball.png")
		@x = @y = @vel_x = @vel_y = @angle = 0.0
	end

	def warp(x,y)
		@x, @y, = x, y
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, 4)
		@vel_y += Gosu::offset_y(@angle, 3)
	end

	def move
		@x += @vel_x
		@y += @vel_y

		@vel_y *= -1 if (@y < 0) || (@y + @image.height > Constants::GAME_HEIGHT)
	end

	def draw
		@image.draw(@x, @y, ZOrder::Ball)
	end

	def launch
		@angle = (rand(120)+30)*[1,-1][rand(2)]
		accelerate
	end

	def reset
		@vel_x = @vel_y = @angle = 0.0
		warp(Constants::GAME_WIDTH/2, Constants::GAME_HEIGHT/2)
	end
end