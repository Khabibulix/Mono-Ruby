require './Grid.rb'

class Game
    attr_reader :grid, :player_symbol
    def initialize(grid)
        @grid = grid
        @player_symbol = ""
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

    # def check_for_end_of_game()
    # end

    # def check_for_victory()
    # end

    # def get_player_input()
    # end

    # def get_computer_input()
    # end

end

game = Game.new(Grid.new(3))
game.get_symbol_for_player
p game.player_symbol