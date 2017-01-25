class Scale

	S = 1
	T = 2

	MAJOR_SCALE = [T,T,S,T,T,T,S]

	ROTATED_SCALE = [T,S,T,T,S,T,T]

	SEMITONE_RANGE = 13
	LABELS = ['A','A#','B','C','C#','D','D#','E','F','F#','G','G#','A']

	ROUND_SEMITONES = true

	HZ_SEMITONE_RATIO = 2 ** (1.0/12)

	def initialize window
		@window = window
	end

	def self.pitch_from_percent percent
		semitone_count = percent * SEMITONE_RANGE
		semitone_count = semitone_count.to_i if ROUND_SEMITONES
		HZ_SEMITONE_RATIO ** semitone_count
	end

	def draw
		draw_piano_keys
	end

	private

		def draw_piano_keys
			SEMITONE_RANGE.times do |i|
				if key_is_white_key?(i)
					draw_key(i, Gosu::Color::WHITE)
					draw_key_label(i, Gosu::Color::BLACK)
				else
					draw_key(i, Gosu::Color::BLACK)
					draw_key_label(i, Gosu::Color::WHITE)
				end
			end
		end

		def key_height
			@window.height.to_f / SEMITONE_RANGE
		end

		def key_is_white_key? i
			white_keys.include?(SEMITONE_RANGE - (i + 1))
		end

		def key_is_black_key? i
			!key_is_white_key?(i)
		end

		def white_keys
			white = [0]
			ROTATED_SCALE.each_with_index do |value, i|
				white << ROTATED_SCALE[0..i].inject(:+)
			end
			white
		end

		def draw_key i, c=nil
			c ||= Gosu::Color::WHITE
			z_index = 10
			y1 = (key_height * i).to_i
			y2 = y1 + key_height - 1
			@window.draw_quad(0, y1, c, @window.width, y1, c, 0, y2, c, @window.width, y2, c, z_index)
		end

		def draw_key_label i, c=nil
			text_indent = 30
			text = LABELS.reverse[i]
			c ||= Gosu::Color::BLACK
			z_index = 30
			x = @window.width - text_indent
			y = (key_height * i) + (key_height/2).to_i
			@window.font.draw(text, x, y, z_index, 1.0, 1.0, c)
		end
end