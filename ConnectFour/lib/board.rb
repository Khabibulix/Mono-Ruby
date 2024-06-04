class Board
    attr_accessor :total_size, :grid, :columns, :rows
    def initialize(columns = 7, rows = 6)
        @total_size = columns * rows
        @columns = columns
        @rows = rows
        @grid = create_grid
    end

    def create_grid
        Array.new(rows) {Array.new(columns, ".")}
    end
end
