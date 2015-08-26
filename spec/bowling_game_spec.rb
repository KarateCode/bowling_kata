require './game'

RSpec.describe Game do
	describe "Game" do
		before(:each) do
			@g = Game.new
		end

		it "gutter game" do
			roll_many(20, 0)
			expect(@g.score).to eq(0)
		end

		it "all ones" do
			roll_many(20, 1)
			expect(@g.score).to eq(20)
		end

		it "one spare" do
			roll_spare
			@g.roll(3)
			roll_many(17, 0)
			expect(@g.score).to eq(16)
		end

		it "one strike" do
			roll_strike
			@g.roll(3)
			@g.roll(4)
			roll_many(16, 0)
			expect(@g.score).to eq(24)
		end

		it "perfect game" do
			roll_many(12, 10)
			expect(@g.score).to eq(300)
		end

		def roll_many(n, pins)
			(1..n).each do |i|
				@g.roll(pins)
			end			
		end

		def roll_spare
			@g.roll(5)
			@g.roll(5)
		end

		def roll_strike
			@g.roll(10)
		end
	end
end