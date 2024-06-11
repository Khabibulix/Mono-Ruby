require_relative '../lib/pieces/piece.rb'
require_relative '../lib/pieces/rook.rb'

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
        @white_rook = Rook.new("white")
        @black_rook = Rook.new("black")
    end

    context "At creation" do
        it "Should have differents symbols if differents colors" do
            expect(@white_rook.symbol).not_to eq @black_rook.symbol
        end
    end
end