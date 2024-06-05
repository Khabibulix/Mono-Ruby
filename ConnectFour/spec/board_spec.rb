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
        expect(@board.grid[0][-1].value).to eq "X"
    end

    specify "Adding to the grid with pawn at the bottom should add on top" do
        @board.add(0, "X")
        @board.add(0, "X")
        expect(@board.grid[0][-2].value).to eq "X"
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

end