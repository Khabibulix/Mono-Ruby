require './Grid.rb'

class Game
    attr_reader :grid
    def initialize(grid)
        @grid = grid
    end
end

game = Game.new(Grid.new(3))
game.grid.display_grid
