require_relative '../lib/grid'

describe "A Grid should have a constant length" do
    context "Should have a 7x6 where 7 is the width" do
        it "Total cells should be 42" do
            grid = Grid.new
            expect(grid.total_size).to eq 42
        end
    end
end
