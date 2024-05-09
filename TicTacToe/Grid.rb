require './Cell.rb'

class Grid < Cell
    attr_reader :width, :grid
    def initialize(width)
        @width = width
        @grid = create_grid
    end
    

    def display_grid()
        for row in 0...3
            for col in 0...3
                print self.grid[row][col].content + " "
            end
            puts ""
        end
        grid
    end

    def edit_the_grid(row, col, content)
        grid[row][col].change_content(content)
    end

    private
    def create_grid()
        grid_array = Array.new(self.width) {Array.new(self.width)}
        for row in 0...self.width
            for col in 0...self.width
                grid_array[row][col] = Cell.new("x")
            end
        end
        grid_array

    end


    # def is_grid_full(self)
    # end

    # def empty_the_grid()
    #     for row in 0...3
    #         for col in 0...3
    #             self.grid[row][col].content = "."
    #         end
    #     end
    # end

    # def get_empty_cells(self)
    # end

    

end

grid = Grid.new(3)
p "Old grid"
grid.display_grid
grid.edit_the_grid(1, 1, "O")
p "New grid"
grid.display_grid
