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
        grid[row - 1][col - 1]
    end

    def get_rows()
        row_array = []
        for row in grid
            row_array.push(row)
        end
        row_array
    end

    def get_cols()
        col_array = []
        col_index = 0
        for iter in grid
            col_array.push(grid.map{|col| col[col_index]})
            col_index += 1
        end
        col_array
    end

    def get_diagonals()
        diagonal_array = []
        first_diagonal = []
        second_diagonal = []
        col_index = 2
        for index in 0...3
            first_diagonal.push(@grid[index][index])
        end
        for row_index in 0...3
            second_diagonal.push(@grid[row_index][col_index])
            col_index -= 1
        end
        diagonal_array.push(first_diagonal, second_diagonal)
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

end
