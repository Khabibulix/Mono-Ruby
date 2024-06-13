require_relative '../lib/pieces/rook'

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
    end

    context "With artificial center position" do
        it "Should have a correct moves array" do
            white_rook_center = Rook.new(color="white", number=1, initial_pos=[4,3])
            expected = [
                [0,3],
                [1,3],
                [2,3],
                [3,3],
                [5,3],
                [6,3],
                [7,3],
                [4,0],
                [4,1],
                [4,2],
                [4,4],
                [4,5],
                [4,6],
                [4,7]].sort
            expect(white_rook_center.moves.sort).to eq expected
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
            white_rook_center = Rook.new(color="white", number=1, initial_pos=[4,3])
            white_rook_center.move([4,0])
            expect(white_rook_center.board.grid[4][0]).to eq "\u265C"
        end

        it "Should change current position after moving" do
            white_rook_center = Rook.new(color="white", number=1, initial_pos=[4,3])
            white_rook_center.move([4,0])
            expect(white_rook_center.current_pos).to eq [4,0]
        end
    end
end