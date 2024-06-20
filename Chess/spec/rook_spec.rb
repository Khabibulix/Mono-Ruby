require_relative '../lib/pieces/rook'
require_relative '../lib/board'

describe "A Rook in general" do
    before(:all) do
        @board = Board.new  
        @white_rook1 = Rook.new("white", 1)
        @white_rook2 = Rook.new("white", 2)
        @black_rook = Rook.new("black", 1)
        @white_rook_center = Rook.new("white", 1, [3,2])
        @white_rook_center_with_obstacle = Rook.new("white", 1, [4,3])
        @obstacle_rook = Rook.new("white", 1, [6,3]) 
        @second_obstacle_rook = Rook.new("white", 1, [1,3]) 
        @third_obstacle_rook = Rook.new("white", 2, [3,3])
        @fourth_obstacle_rook = Rook.new("white", 2, [4,1])
        @right_obstacle_rook = Rook.new("white", 1, [3,5])
        
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

    context "With center position" do
        it "Should have a correct moves array" do
            @board.clear
            @board.add_piece(@white_rook_center)
            expected = [
                [0, 2],
                [1, 2],
                [2, 2],
                [3, 0],
                [3, 1],
                [3, 3],
                [3, 4],
                [3, 5],
                [3, 6],
                [3, 7],
                [4, 2],
                [5, 2],
                [6, 2],
                [7, 2]].sort
            expect(@white_rook_center.generate_moves(@board)).to eq expected
        end

        it "Should return correctly the top column of the rook" do
            @board.clear
            @board.add_piece(@white_rook_center)
            expected = [
                [0,2],
                [1,2],
                [2,2]].sort            
            expect(@white_rook_center.generate_top_column(@white_rook_center.current_pos, @board)).to eq expected
        end

        it "Should return correctly the top column of the rook if obstacle" do
            @board.clear
            @board.add_piece(@white_rook_center_with_obstacle)
            @board.add_piece(@second_obstacle_rook)
            expected = [
                [2,3],
                [3,3]].sort

            expect(@white_rook_center_with_obstacle.generate_top_column(@white_rook_center_with_obstacle.current_pos, @board)).to eq expected
        end

        it "Should return empty array if obstacle is adjacent at top" do
            @board.clear
            @board.add_piece(@white_rook_center_with_obstacle)
            @board.add_piece(@third_obstacle_rook)
            expect(@white_rook_center_with_obstacle.generate_top_column(@white_rook_center_with_obstacle.current_pos, @board)).to eq []
        end


        it "Should return correctly the bottom column of the rook" do
            @board.clear
            @board.add_piece(@white_rook_center)
            expected = [
                [4,2],
                [5,2],
                [6,2],
                [7,2]].sort            
            expect(@white_rook_center.generate_bottom_column(@white_rook_center.current_pos, @board)).to eq expected
        end
        
        it "Should return correctly the bottom column of the rook if obstacle" do
            @board.clear
            @board.add_piece(@white_rook_center_with_obstacle)
            @board.add_piece(@obstacle_rook)
            expected = [[5,3]]
            expect(@white_rook_center_with_obstacle.generate_bottom_column(@white_rook_center_with_obstacle.current_pos, @board)).to eq expected
        end


        it "Should return correctly the left row of the rook" do
            @board.clear
            @board.add_piece(@white_rook_center)
            expected = [
                [4,0],
                [4,1],
                [4,2]].sort            
            expect(@white_rook_center.generate_left_row([4,3], @board)).to eq expected
        end

        it "Should return correctly the left row of the rook if obstacle" do
            @board.clear
            @board.add_piece(@fourth_obstacle_rook)
            @board.add_piece(@white_rook_center)
            expected = [
                [3,0],
                [3,1]].sort            
            expect(@white_rook_center.generate_left_row(@white_rook_center.current_pos, @board)).to eq expected
        end

        it "Should return correctly the right row of the rook" do
            @board.clear
            @board.add_piece(@white_rook_center)
            expected = [
                [3,3],
                [3,4],
                [3,5],
                [3,6],
                [3,7]].sort            
            expect(@white_rook_center.generate_right_row(@white_rook_center.current_pos, @board)).to eq expected
        end

        it "Should return correctly the right row of the rook if obstacle" do
            @board.clear
            @board.add_piece(@right_obstacle_rook)
            @board.add_piece(@white_rook_center)
            expected = [
                [3,3],
                [3,4]].sort            
            expect(@white_rook_center.generate_right_row(@white_rook_center.current_pos, @board)).to eq expected
        end

        

        it "Should have a correct moves array if there is an obstacle" do
            @board.clear
            @board.add_piece(@white_rook_center_with_obstacle)
            @board.add_piece(@obstacle_rook)
            expected = [
                [0, 3],
                [1, 3],
                [2, 3],
                [3, 3],
                [4, 0],
                [4, 1],
                [4, 2],
                [4, 4],
                [4, 5],
                [4, 6],
                [4, 7],
                [5,3]].sort
            expect(@white_rook_center_with_obstacle.generate_moves(@board)).to eq expected
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
           @white_rook_center.move([3,3])
            expect(@white_rook_center.board.grid[3][3]).to eq @white_rook_center.symbol
        end

        it "Should change current position after moving" do
            @board.clear
            @board.add_piece(@white_rook_center)
            @white_rook_center.move([5,2])
            expect(@white_rook_center.current_pos).to eq [5,2]
        end
    end
end