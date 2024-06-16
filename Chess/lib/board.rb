class Board
    attr_reader :width, :height
    attr_accessor :grid
    def initialize(width=8)
        @width = width
        @height = width
        @grid = Array.new(@width) {Array.new(@width, ".")}
    end

    def display
        grid.each {|row| p row.join(" ") }
    end

    def empty?(pos)
        pos == '.' ? true : false
    end

    #update_cell([3,4], "test")
    def update_cell(pos, new_value)
        grid[pos[0]][pos[1]] = new_value
    end

    def add_piece(piece)
        grid[piece.initial_pos[0]][piece.initial_pos[1]] = piece.symbol
    end

    def clear
        grid.each_with_index do |row, r_index|
            row.each_with_index do |cell, index|
                grid[r_index][index] = "."
            end
        end
    end

end

$board = Board.new
$board.clear
