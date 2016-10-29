class Paddle
	attr_reader :x, :y

	def initialize
		@image = Gosu::Image.new("media/images/paddle.png")
		@x = @y = @vel_x = @vel_y = 0.0
	end

	def warp(x,y)
		@x, @y = x, y
	end

	def accelerate(dir)
		@vel_y += 0.5*dir
	end

	def move
		@y += @vel_y
		@y = 0 if @y < 0
		@y = (480 - @image.height) if (@y + @image.height) > 480

		@vel_y *= 0.95
	end

	def draw
		@image.draw(@x, @y, ZOrder::Paddle)
	end
end