require './Cell.rb'

class Grid < Cell
    attr_reader :width, :grid
    def initialize(width)
        @width = width
        @grid = create_grid
    end
    

    def display_grid()
      @grid.each do |row|
        row.each { |cell| print "#{cell.content} " }
        puts ''
      end
    end

    def get_cell(row, col)
        @grid[row - 1][col - 1]
    end

    def get_rows()
      row_array = []
      @grid.each { |row| row_array.push(row) }       
    end

    def get_cols()
      col_array = []
      @width.times { |i| col_array.push(@grid.map { |row| row[i] }) }
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

    def edit_grid(row, col, content)
        grid[row][col].change_content(content)
    end    

    def clear_the_grid()
        @grid.each do |row|
            row.each { |cell| cell.change_content(".") }
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

    def grid_full?()
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
        Array.new(@width) do
            Array.new(@width) { |element| element = Cell.new(".") }
        end
    end        
end
