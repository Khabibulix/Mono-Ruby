require_relative '../lib/grid'

describe do

    before(:all) {@grid = Grid.new}

    specify "Total cells should be 42 or 6*7" do
        expect(@grid.total_size).to eq 42
    end

    specify "Grid should be filled with dots at init" do
        expect(@grid.grid[0][0]).to eq "."
    end

end