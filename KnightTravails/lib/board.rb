require_relative 'graph'
require_relative 'knight'

class Board < Graph
    attr_accessor :board
    def initialize
        @board = Graph.new.matrix
        super
    end
end

board = Board.new
knight = Knight.new
board.matrix[knight.x_pos][knight.y_pos] = knight.symbol
board.print_matrix