require_relative 'node'

class Board
    attr_accessor :total_size, :grid
    def initialize(columns = 7, rows = 6)
        @total_size = columns * rows
        @grid = create_grid
    end

    def create_grid
        grid = Array.new(7) {Array.new(6, ".")}
        grid.each_with_index do |row, row_index|
            row.each_with_index do |cell, col_index|
                grid[row_index][col_index] = Node.new([row_index, col_index])
            end
        end
        grid
    end

    def add(column, symbol)      
        return grid[column][-1] = symbol if grid[column].all?(".")
        grid[column].to_enum.with_index.reverse_each do |node, index|
            return grid[column][index].value = symbol if node.value == "."
        end
    end

    def get_non_empty_nodes
        result = []
        @grid.each do |row|
            row.each do |cell|
                result.push(cell) if cell.value != "."                
            end
        end
        result
    end

    def separate_by_symbol(symbol)
        get_non_empty_nodes.select{|node| node.value == symbol}
    end

    def clear
        @grid.each do |row|
            row.each do |cell|
                cell.value = "."                
            end
        end
    end
    

    def searching_for_victory_in_hash(hash)
        temp_array = []
        hash.keys.each do |key|
            if hash[key].length >= 4
                hash[key].each{|node| temp_array.push(node[1])}
                if temp_array == temp_array[0].upto(temp_array[-1]).to_a
                    return true
                end                
            end
        end
    end

    #checking_for_left_diagonal([1,4], "X")
    def checking_for_left_diagonal(pos, symbol)
        row = pos[0]
        col = pos[1]
        return true if grid[row - 1][col - 1] == symbol && grid[row - 2][col - 2] == symbol && grid[row - 3][col - 3] == symbol
    end

    def checking_for_right_diagonal(pos, symbol)
        row = pos[0]
        col = pos[1]
        return true if grid[row + 1][col + 1] == symbol && grid[row + 2][col + 2] == symbol && grid[row + 3][col + 3] == symbol
    
    end

    def victory?(symbol)
        array_to_check = separate_by_symbol(symbol)
        columns_hash = Hash.new {|h,k| h[k]=[]}
        rows_hash = Hash.new {|h,k| h[k]=[]}

        # Populating the hash
        array_to_check.each do |node|
            columns_hash[node.position[0]].push(node.position)
            rows_hash[node.position[1]].push(node.position)
            return true if checking_for_left_diagonal(node.position, symbol) || checking_for_right_diagonal(node.position, symbol)
        end        
        
        return true if searching_for_victory_in_hash(columns_hash) || searching_for_victory_in_hash(rows_hash)
        
        return false        
    end


end

