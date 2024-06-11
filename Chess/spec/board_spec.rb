require_relative '../lib/board.rb'

describe "A Board in general" do
    before(:all) do
        @board = Board.new
    end

    context "at creation" do
        it "should pass by default" do
            board = Board.new
            expect(board)
        end

        it "a Board Row should be of class Array" do
            expect(@board.grid).to be_an_instance_of Array
        end
        
    end

    context "at update" do
        it "should change value correctly" do
            @board.update_cell([4,4], "X")
            expect(@board.grid[4][4]).to eq "X"
        end
    end

end