require_relative '../lib/board'

describe do

    before(:all) do 
        @board = Board.new
        @board.clear
    end

    specify "Total cells should be 42 or 6*7" do
        expect(@board.total_size).to eq 42
    end

    specify "Grid should be filled with dots at init" do
        expect(@board.grid[0][0].value).to eq "."
    end

    specify "Adding to the grid should change bottom of column in parameter" do
        @board.add(0, "X")
        expect(@board.grid[-1][0].value).to eq "X"
    end

    specify "Adding to the grid with pawn at the bottom should add on top" do
        @board.add(2, "X")
        @board.add(2, "X")
        expect(@board.grid[5][2].value).to eq "X"
    end

    specify "Grid item should be of Node Class after nodification" do
        expect(@board.grid[0][0].class).to eq Node
    end

    specify "After clearing the grid, length should be 0" do
        @board.clear
        expect(@board.get_non_empty_nodes.length).to eq 0
    end

    specify "Array should not be empty" do
        @board.add(1, "X")
        expect(@board.get_non_empty_nodes.length).not_to eq 0
    end

    specify "Should grab all symbols in parameters" do
        @board.clear
        @board.add(1, "O")
        @board.add(1, "X")
        @board.add(1, "X")
        expect(@board.separate_by_symbol("X").length).to eq 2
    end

    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  O  .  .  .  .  ."
    # ".  O  .  .  .  .  ."
    # ".  O  .  .  .  .  ."
    # ".  O  .  .  .  .  ."
    specify "Victory check for column should be true" do
        @board.clear
        4.times {@board.add(1, "O")}
        expect(@board.victory?("O")).to be true
    end

    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  O  O  O  O  .  ."
    specify "Victory check for rows should be true" do
        @board.clear
        @board.add(2, "O")
        @board.add(1, "O")
        @board.add(3, "O")
        @board.add(4, "O")
        expect(@board.victory?("O")).to be true
    end

    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # "O  .  O  .  O  .  O"
    specify "Victory check should be false for incomplete row with empty cells inside" do
        @board.clear
        @board.add(0, "O")
        @board.add(2, "O")
        @board.add(4, "O")
        @board.add(6, "O")
        expect(@board.victory?("O")).to be false
    end

    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  X  .  ."
    # ".  .  .  .  X  .  ."
    # ".  .  .  X  X  .  ."
    specify "Victory check should be false for incomplete column" do
        @board.clear
        @board.add(3, "X")
        3.times{@board.add(4, "X")}
        expect(@board.victory?("X")).to eq false
    end


    
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  .  X  .  ."
    # ".  .  .  X  O  .  ."
    # ".  .  X  O  O  .  ."
    # ".  X  O  O  O  .  ."
    specify "Victory check for right diagonals should be true" do
        @board.clear
        @board.add(1, "X")
        @board.add(2, "O")
        @board.add(2, "X")
        2.times {@board.add(3, "O")}
        @board.add(3, "X")
        3.times {@board.add(4, "O")}
        @board.add(4, "X")
        expect(@board.checking_for_right_diagonal([5,1], "X")).to be true
    end

    # ".  .  .  .  .  .  ."
    # ".  .  .  .  .  .  ."
    # ".  .  .  X  .  .  ."
    # ".  .  .  O  X  .  ."
    # ".  .  .  O  O  X  ."
    # ".  .  .  O  O  O  X"
    specify "Victory check for left diagonals should be true" do
        @board.clear
        @board.add(6, "X")
        @board.add(5, "O")
        @board.add(5, "X")
        2.times {@board.add(4, "O")}
        @board.add(4, "X")
        3.times {@board.add(3, "O")}
        @board.add(3, "X")
        expect(@board.checking_for_left_diagonal([5,6], "X")).to be true
    end

    specify "Should check if node is in grid" do
        expect(@board.inside?([6,3])).to be false
    end

    specify "Hash for col should return a key for the col, and values for cells in col" do
        @board.clear
        @board.add(1, "X")
        test_col_hash = Hash.new {|h,k| h[k]=[]}
        expect(@board.populate_hash(test_col_hash, "col", "X").key?(1) && @board.populate_hash(test_col_hash, "col", "X").value?(6) )
    end

    specify "Hash for row should return a key for the row, and values for cells in row" do
        @board.clear
        @board.add(1, "X")
        test_col_hash = Hash.new {|h,k| h[k]=[]}
        expect(@board.populate_hash(test_col_hash, "row", "X").key?(6) && @board.populate_hash(test_col_hash, "col", "X").value?(1) )
    end

    specify "Should check that hash is not empty if we add one element" do
        @board.clear
        @board.add(1, "X")
        test_hash = Hash.new {|h,k| h[k]=[]}
        current_length_of_hash = test_hash
        @board.populate_hash(test_hash, "row", "X")
        expect(test_hash.empty?).to be false
    end

    specify "Should check that hash length changes correctly" do
        @board.clear
        @board.add(1, "X")
        test_hash = Hash.new {|h,k| h[k]=[]}
        current_length_of_hash = test_hash.length
        @board.populate_hash(test_hash, "row", "X")
        expect(test_hash.length).to be > current_length_of_hash
    end

    specify "#Searching_for_victory_in_hash should be false for falsy column" do
        @board.clear
        @board.add(3, "X")
        3.times{@board.add(4, "X")}
        test_hash = @board.populate_hash(Hash.new {|h,k| h[k]=[]}, "col", "X")
        expect(@board.searching_for_victory_in_hash(test_hash, "col")).to eq false
    end

    specify "#Searching_for_victory_in_hash should be false for falsy row" do
        @board.clear
        @board.add(0, "O")
        @board.add(2, "O")
        @board.add(4, "O")
        @board.add(6, "O")
        test_hash = @board.populate_hash(Hash.new {|h,k| h[k]=[]}, "row", "X")
        expect(@board.searching_for_victory_in_hash(test_hash, "row")).to be false
    end

    specify "If we add 4 elements at the bottom, key 'row 5' should be of length 4" do
        @board.clear
        @board.add(0, "O")
        @board.add(2, "O")
        @board.add(4, "O")
        @board.add(6, "O")
        test_hash = @board.populate_hash(Hash.new {|h,k| h[k]=[]}, "row", "O")
        expect(test_hash[5].length).to eq 4
    
    end
end