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

    def add(column, symbol)        
        return grid[column][-1] = symbol if grid[column].all?(".")
        grid[column].to_enum.with_index.reverse_each do |cell, index|
            if cell == "."
                return grid[column][index] = symbol
            end
        end
    end
end
