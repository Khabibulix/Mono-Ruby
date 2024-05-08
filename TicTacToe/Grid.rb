require './Case.rb'

class Grid < Case
    attr_reader :width    
    def initialize(width)
        @width = width
    end

    def create_grid()
        grid_array = Array.new(self.width) {Array.new(self.width)}
        for row in 0...self.width
            for col in 0...self.width
                grid_array[row][col] = Case.new(".")
            end
        end
        grid_array

    end

    def display_grid()
    
    end


    # def is_grid_full(self)
    # end

    # def empty_the_grid(self)
    # end

    # def get_empty_cells(self)
    # end

end

grid = Grid.new(3)
