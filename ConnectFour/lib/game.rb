class Game 
    def welcome_player
        puts "Hey there, welcome to my Connect Four game!"
        puts "The rules are simple, I'm going to ask you a number between 1 and 7"
        puts "This number is going to represent the column where you want to add your pawn"
    end

    def get_input
        puts "Enter your number here:\n"
        result = gets.chomp.to_i
        return result if result.between?(1,7)
        puts "Please enter a number between 1 and 7"
        get_input
    end
end
game = Game.new
game.welcome_player