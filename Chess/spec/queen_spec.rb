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
    end
end