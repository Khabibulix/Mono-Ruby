require './Grid.rb'

class Game
    attr_reader :grid, :player_symbol, :computer_symbol
    def initialize(grid)
        @grid = grid
        @player_symbol = ""
        @computer_symbol = "X"
    end

    def get_symbol_for_player()
        puts "Choose your symbol!"
        player_symbol = gets.chomp()
        if player_symbol.length != 1
            puts "Too long, we're gonna take the first character, sorry..."
            @player_symbol += player_symbol[0]
        else
            @player_symbol += player_symbol
        end

    end

    def check_for_player_symbol_and_computer_symbol_inequality()
        if @computer_symbol == @player_symbol
            @computer_symbol = "O"
        end
    end

    # def launch_the_game()
    # end

    # def check_for_end_of_game()
        #Besoin de check_for_victory
    # end

    # def check_for_victory()
    # end

    def asking_for_input_for_player()
        puts "Please enter the row of the cell you want to play"
        row = gets.chomp
        puts "Please enter the column of the cell you want to play"
        col = gets.chomp
        "#{row},#{col}"
    end

    # def checking_for_input_for_player(row, col)
    # end

    # def get_player_turn_input()
        
    # end

    # def get_computer_turn_input()
    # end

end

game = Game.new(Grid.new(3))
p game.asking_for_input_for_player