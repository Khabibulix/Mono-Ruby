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
    

    def asking_for_input_for_player()
        puts "\nGrid is currently like this:"
        @grid.display_grid
        puts "\nPlease enter the row of the cell you want to play"
        row = gets.chomp
        puts "Please enter the column of the cell you want to play"
        col = gets.chomp

        case is_input_valid_for_player(row, col)
        when "No method Error"
            puts "Enter a number between 1 and #{@grid.width} please"
            asking_for_input_for_player
        when "NaN value"
            puts "Enter a number between 1 and #{@grid.width} please"
            asking_for_input_for_player
        when false
            puts "Sorry cell is already used"
            asking_for_input_for_player
        else
            return "#{row},#{col}"
        end
    end

    def is_input_valid_for_player(row, col)
        
        begin
            if !!Float(row) && !!Float(col)
                return grid.get_cell(row.to_i, col.to_i).content == "."
            end
        rescue NoMethodError
            return "No method Error"
        rescue ArgumentError
            return "NaN value"
        end
    end

    # def edit_the_grid_using_player_input()
    # end

    # def launch_the_game()
    # end

    # def check_for_end_of_game()
        #Besoin de check_for_victory
    # end

    # def check_for_victory()
    # end

    # def get_computer_turn_input()
    # end

end

game = Game.new(Grid.new(3))
p game.asking_for_input_for_player
