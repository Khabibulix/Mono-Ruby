require_relative '../lib/pieces/piece'
require_relative '../lib/pieces/rook'
require_relative '../lib/board'

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
    end
end

describe "A Rook in general" do
    before(:all) do
        @white_rook1 = Rook.new("white", 1)
        @white_rook2 = Rook.new("white", 2)
        @black_rook = Rook.new("black", 1)
    end

    context "At creation" do
        it "Should have differents symbols if differents colors" do
            expect(@white_rook1.symbol).not_to eq @black_rook.symbol
        end

        it "Should have different position when different color" do
            expect(@white_rook1.initial_pos).not_to eq @black_rook.initial_pos
        end

        it "Should have different position when same color" do
            expect(@white_rook1.initial_pos).not_to eq @white_rook2.initial_pos
        end

        it "Should have a correct moves array" do
            expected = [
                [6,0],
                [5,0],
                [4,0],
                [3,0],
                [2,0],
                [1,0],
                [0,0],
                [7,1],
                [7,2],
                [7,3],
                [7,4],
                [7,5],
                [7,6],
                [7,7]].sort
            expect(@white_rook1.moves.sort).to eq expected
        end
    end

    context "When moving" do
        it "Should not be able to move in diagonal" do
            expect(@white_rook1.valid?([7,0], [4,4])).to be false
        end

        it "Should be able to move when no obstacles with same row" do
            expect(@white_rook1.valid?([7,0], [7,3])).to be true
        end

        it "Should change cell value after moving" do
            @white_rook1.move([7,1])
            expect(@white_rook1.board.grid[7][1]).to eq "\u265C"
        end
    end
end