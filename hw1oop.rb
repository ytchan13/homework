require 'pry'

class Player
	attr_accessor :hand
	attr_reader :name

	def initialize(name)
		@name = name
		@hand = nil
	end

	def pick_hand
		begin
			puts "please choose one of the following: R / P / S"
      		user_input = gets.chomp.upcase
    	end while !["R", "P", "S"].include?(user_input) 
    	self.hand = user_input
	end
end

class Computer < Player
	def pick_hand
		arr = ["R","P","S"]
		self.hand = arr.sample
	end
end

class Guess
	attr_accessor :player, :computer

	def initialize()
		@player = Player.new(user_name)
		@computer = Computer.new("AI")
	end

	def user_name
		puts "Please Enter Your Name : "
		gets.chomp.capitalize
	end

	def play_again
		begin
			puts "Play Again?: Y / N"
			isagain = gets.chomp.upcase
		end while !["Y", "N"].include?(isagain)
		isagain
	end

	def result(res,vans)
		if res == "W"
			puts "Congratulation!! You Won!! The computer answer is #{vans}"
		else
			puts "Sorry!! You Lost!! The computer answer is #{vans}"
		end
	end

	def judge(users,comps)
	  if users == comps
	    puts "平手唷！再來一次吧！！"
	  else
	    if comps == "R"
	      case users
	      when "P"
	        result("W","#{comps}")
	      else
	        result("L","#{comps}")
	      end
	    elsif comps == "P"
	      case users
	      when "S"
	        result("W","#{comps}")
	      else
	        result("L","#{comps}")
	      end
	    else
	      case users
	      when "R"
	        result("W","#{comps}")
	      else
	        result("L","#{comps}")
	      end 
	    end
	   end 
	end

	def play_game
		begin
			self.player.pick_hand
			self.computer.pick_hand
			judge(player.hand,computer.hand)
		end while play_again == "Y"
	end
end

Guess.new.play_game
