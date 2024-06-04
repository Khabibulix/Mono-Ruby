require_relative '../lib/board'

describe do

    before(:all) {@board = Board.new}

    specify "Total cells should be 42 or 6*7" do
        expect(@board.total_size).to eq 42
    end

    specify "Grid should be filled with dots at init" do
        expect(@board.grid[0][0]).to eq "."
    end

    specify "Adding to the grid should change bottom of column in parameter" do
        @board.add(0, "X")
        expect(@board.grid[0][-1]).to eq "X"
    end

    specify "Adding to the grid with pawn at the bottom should add on top" do
        @board.add(0, "X")
        @board.add(0, "X")
        expect(@board.grid[0][-2]).to eq "X"
    end

end