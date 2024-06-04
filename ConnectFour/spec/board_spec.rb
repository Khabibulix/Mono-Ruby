require_relative '../lib/board'

describe do

    before(:all) {@board = Board.new}

    specify "Total cells should be 42 or 6*7" do
        expect(@board.total_size).to eq 42
    end

    specify "Grid should be filled with dots at init" do
        expect(@board.grid[0][0]).to eq "."
    end

end