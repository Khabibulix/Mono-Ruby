require './Cell.rb'

class Grid < Cell
    attr_reader :width, :grid
    def initialize(width)
        @width = width
        @grid = create_grid
    end
    

    def display_grid()
        for row in 0...@width
            for col in 0...@width
                print self.grid[row][col].content + " "
            end
            puts ""
        end
        grid
    end

    def edit_the_grid(row, col, content)
        grid[row][col].change_content(content)
    end

    def is_grid_full()
        result_array = []
        for row in grid do
            row.each do |cell|
                result_array.push(cell.content == ".")              
            end
        end
        result_array.none?
    end

    def clear_the_grid()
        for row in 0...@width
            for col in 0...@width
                self.grid[row][col].change_content(".")
            end
        end
    end

    def get_empty_cells()
        empty_cells_array = []
        for row in 0...@width
            for col in 0...@width
                cell = self.grid[row][col]
                if cell.content == "."
                    empty_cells_array.push(cell)
                end
            end
        end
        empty_cells_array
    end

    private
    def create_grid()
        grid_array = Array.new(@width) {Array.new(@width)}
        for row in 0...@width
            for col in 0...@width
                grid_array[row][col] = Cell.new("x")
            end
        end
        grid_array

    end    

end

grid = Grid.new(3)
grid.edit_the_grid(0, 1, ".")
grid.edit_the_grid(2, 1, ".")
grid.display_grid
p grid.get_empty_cells.length
