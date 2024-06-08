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

    specify "Victory check for column should be true" do
        @board.clear
        @board.add(1, "X")
        @board.add(1, "X")
        @board.add(1, "X")
        @board.add(1, "X")
        expect(@board.victory?("X")).to be true
    end

    specify "Victory check for rows should be true" do
        @board.clear
        @board.add(4, "X")
        @board.add(2, "X")
        @board.add(1, "X")
        @board.add(3, "X")
        @board.add(4, "X")
        expect(@board.victory?("X")).to be true
    end

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

    specify "Victory check for right diagonals should be true" do
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

end