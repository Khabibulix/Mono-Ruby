require './Case.rb'

class Grid < Case
    attr_reader :width    
    def initialize(width)
        @width = width
    end

    def create_grid()
        for row in 0...self.width
            for col in 0...self.width
                print(".  ")
            end
            print("\n")
        end

    end

    # def is_grid_full(self)
    # end

    # def empty_the_grid(self)
    # end

    # def get_empty_cells(self)
    # end

end

grid = Grid.new(3)
grid.create_grid
