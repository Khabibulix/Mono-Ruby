require_relative '../lib/game'

describe "A Game in general" do

    before(:all) do
        @game= Game.new($board)
    end

    context "At creation" do
        it "Should have a non empty pieces array" do
            expect(@game.pieces.empty?).to eq false
        end

    end
end