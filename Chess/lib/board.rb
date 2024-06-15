class Board
    attr_reader :width, :height
    attr_accessor :grid
    def initialize(width=8)
        @width = width
        @height = width
        @grid = create_grid
    end

    def create_grid
        Array.new(@width) {Array.new(@width, ".")}
    end

    def display
        grid.each {|row| p row.join "  "}
    end

    def empty?(pos)
        pos = '.' ? true : false
    end

    #update_cell([3,4], "test")
    def update_cell(pos, new_value)
        grid[pos[0]][pos[1]] = new_value
    end
end

$board = Board.new

