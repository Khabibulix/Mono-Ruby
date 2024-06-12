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
    end
end