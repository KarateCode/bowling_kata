class Game
	attr_accessor :rolls, :current_role

	def initialize
		@rolls = []		
		@current_role = 0
	end
	def roll(pins)
		@current_role += 1
		@rolls << pins
	end

	def score
		score = 0
		frame_index = 0
		(1..10).each do
			if strike?(frame_index)
				score += 10 + strike_bonus(frame_index)
				frame_index += 1
			elsif spare?(frame_index)
				score += 10 + spare_bonus(frame_index)
				frame_index += 2
			else
				score += sum_of_balls_in_frame(frame_index)
				frame_index += 2
			end
		end
		return score
	end

	private
	def strike?(frame_index)
		@rolls[frame_index] == 10
	end

	def spare?(frame_index)
		@rolls[frame_index] + @rolls[frame_index+1] == 10
	end

	def spare_bonus(frame_index)
		@rolls[frame_index+2]
	end

	def strike_bonus(frame_index)
		@rolls[frame_index+1] + @rolls[frame_index+2]
	end

	def sum_of_balls_in_frame(frame_index)
		@rolls[frame_index] + @rolls[frame_index+1]
	end
end