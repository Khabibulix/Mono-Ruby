require_relative '../lib/pieces/bishop'

describe "A Bishop in general" do
    before(:all) do
        @white_bishop1 = Bishop.new("white", 1)
        @white_bishop2 = Bishop.new("white", 2)
        @black_bishop = Bishop.new("black", 1)
    end

    context "At creation" do
        it "Should have differents symbols if differents colors" do
            expect(@white_bishop1.symbol).not_to eq @black_bishop.symbol
        end

        it "Should have different position when different color" do
            expect(@white_bishop1.initial_pos).not_to eq @black_bishop.initial_pos
        end

        it "Should have different position when same color" do
            expect(@white_bishop1.initial_pos).not_to eq @white_bishop2.initial_pos
        end
        
    end

    context "At center" do
        it "Should have a correct moves array" do
            bishop_at_center = Bishop.new("black", 1, [4,3])
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
                [7,6]].sort
            expect(bishop_at_center.moves.sort).to eq expected
        end
    end

    # context "At first col" do
    #     it "Should have a correct moves array" do
    #         bishop_at_first_col = Bishop.new("black", 1, [3,0])
    #         expected = [
    #             [2,1],
    #             [1,2],
    #             [0,3],
    #             [4,1],
    #             [5,2],
    #             [6,3],
    #             [7,4]].sort
    #         expect(bishop_at_first_col.moves).to eq expected
    #     end
    # end

end