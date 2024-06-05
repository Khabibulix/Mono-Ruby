require_relative 'node'

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

    def nodify_all_cells
        @grid.each_with_index do |row, row_index|
            row.each_with_index do |cell, col_index|
                @grid[row_index][col_index] = Node.new([row_index, col_index])
            end
        end
        @grid
    end

    def add(column, symbol)        
        return grid[column][-1] = symbol if grid[column].all?(".")
        grid[column].to_enum.with_index.reverse_each do |node, index|
            return grid[column][index].value = symbol if node.value == "."
        end
    end
end