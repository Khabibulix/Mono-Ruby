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

    def get_cell(row, col)
        self.grid[row][col]
    end

    def edit_the_grid(row, col, content)
        grid[row][col].change_content(content)
    end    

    def clear_the_grid()
        for row in 0...@width
            for col in 0...@width
                self.grid[row][col].change_content(".")
            end
        end
    end

    private
    def create_grid()
        grid_array = Array.new(@width) {Array.new(@width)}
        for row in 0...@width
            for col in 0...@width
                grid_array[row][col] = Cell.new(".")
            end
        end
        grid_array
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

    def is_grid_full()
        result_array = []
        for row in grid do
            row.each do |cell|
                result_array.push(cell.content == ".")              
            end
        end
        result_array.none?
    end

end
