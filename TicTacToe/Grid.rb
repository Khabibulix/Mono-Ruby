require './Cell.rb'

class Grid < Cell
    attr_reader :width, :grid
    def initialize(width)
        @width = width
        @grid = create_grid
    end
    

    def display_grid()
      # We can re-write this like so:
      @grid.each do |row|
        row.each { |cell| print "#{cell.content} " }
        puts ''
      end
      #
      # -- and we don't need to return anything (#each method returns the 
      # object it was called on, but this is even unnecessary since we dont do
      # anything with it in Game.rb)
      #
      # for row in 0...@width
      #     for col in 0...@width
      #         print self.grid[row][col].content + " "
      #     end
      #     puts ""
      # end
      # grid
    end

    def get_cell(row, col)
      # Very nice. But here (and elsewhere), prefer @grid over just calling the
      # getter method grid
        grid[row - 1][col - 1]
    end

    def get_rows()
      # Again we can replace the for loop like so:
      row_array = []
      @grid.each { |row| row_array.push(row) }
       
      # This method is redundant no? It just puts the elements of grid, which
      # is an array of arrays, into a new array. So we can just get the rows
      # by accessing grid_instance.grid
      #
      # row_array = []
      # for row in grid
      #     row_array.push(row)
      # end
      # row_array
    end

    def get_cols()
      # Here we can even do a .times loop:
      col_array = []
      @width.times { |i| col_array.push(@grid.map { |row| row[i] }) }
      col_array
      #
      # here the loop variable i ranges over 0, 1, and 2

      # col_array = []
      # col_index = 0
      # for iter in grid
      #     col_array.push(grid.map{|col| col[col_index]})
      #     col_index += 1
      # end
      # col_array
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

    # Pedantic: rename to edit_grid. Some people (most i think) think words like
    # indefinite articles in function names clutter up the code, making it more
    # verbose than it needs to be
    def edit_the_grid(row, col, content)
        grid[row][col].change_content(content)
    end    

    def clear_the_grid()
      # Can do this instead:
        @grid.each do |row|
            row.each { |cell| cell.change_content(".") }
        end

      # for row in 0...@width
      #     for col in 0...@width
      #         self.grid[row][col].change_content(".")
      #     end
      # end
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
      # Rename to grid_full?() instead of is_grid_full
      # Style convention: methods that return booleans (so called "predicate
      # methods") should end with question marks to indicate they return booleans
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
      #
      # then each object_id of each Cell object will be different (they will
      # point to different instances of a Cell object)
      #
      # The return value of an assignment statement is the value assigned, so
      # we can drop the grid_array return statement at the bottom also

      # grid_array = Array.new(@width) {Array.new(@width)}
      # for row in 0...@width
      #     for col in 0...@width
      #         grid_array[row][col] = Cell.new(".")
      #     end
      # end
      # grid_array
    end        
end
