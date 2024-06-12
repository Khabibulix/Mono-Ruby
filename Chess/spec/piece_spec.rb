require_relative '../lib/pieces/piece'


describe "A Piece in general" do
    before(:all) do
        @piece = Piece.new("red")
    end

    context "at creation" do
        it "should have a color" do
            expect(@piece.color).to eq "red"
        end

        it "should have a symbol, empty by default" do
            expect(@piece.symbol).to eq ""
        end

        it "should have an initial_pos, empty by default" do
            expect(@piece.initial_pos).to eq []
        end

        it "should have a position, empty by default" do
            expect(@piece.current_pos).to eq []
        end

        it "should have a method to check if inside the board" do
            expect(@piece.inside?([7,0])).to eq true
        end
    end

    context "when moving" do
        it "should update the value of the cell where it makes the move" do
            @piece.current_pos = [7,1]
            @piece.move([7,2])
            expect(@piece.board.grid[7][2]).to eq ""
        end
    end

end

