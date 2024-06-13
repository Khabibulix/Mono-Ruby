require_relative '../lib/pieces/queen'

describe "A Queen in general" do
    before(:all) do
        @white_queen = Queen.new("white")
        @black_queen = Queen.new("black")
    end

    context "At creation" do
        it "Should have differents symbols if differents colors" do           
            expect(@white_queen.symbol).not_to eq @black_queen.symbol
        end

        it "Should have different position when different color" do
            expect(@white_queen.initial_pos).not_to eq @black_queen.initial_pos
        end
    end

    context "At center" do
        it "Should have a correct moves array" do
            queen_at_center = Queen.new("black", 1 , [4,3])
            expected = [
                [3,2],
                [2,1],
                [1,0],
                [5,2],
                [6,1],
                [7,0],
                [3,4],
                [2,5],
                [1,6],
                [0,7],
                [5,4],
                [6,5],
                [7,6],
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
            expect(queen_at_center.moves).to eq expected
        end
    end

    context "At first col" do
        it "Should have a correct moves array" do
            queen_at_first_col = Queen.new("black", 1,  [3,0])
            expected = [
                [2,1],
                [1,2],
                [0,3],
                [4,1],
                [5,2],
                [6,3],
                [7,4],
                [0,0],
                [1,0],
                [2,0],
                [4,0],
                [5,0],
                [6,0],
                [7,0],
                [3,1],
                [3,2],
                [3,3],
                [3,4],
                [3,5],
                [3,6],
                [3,7]].sort
            expect(queen_at_first_col.moves).to eq expected
        end
    end
end