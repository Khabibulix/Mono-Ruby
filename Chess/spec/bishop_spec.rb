require_relative '../lib/pieces/bishop'
require_relative '../lib/board'

describe "A Bishop in general" do
    before(:all) do
        @board = Board.new
        @white_bishop_default_pos = Bishop.new("white", 1)
        @white_bishop_two_default_pos = Bishop.new("white", 2)
        @white_bishop = Bishop.new("white", 1, [4,3])   
        @white_bishop_with_obstacle = Bishop.new("white", 1, [3,4])     
        @obstacle_bishop_top_left = Bishop.new("white", 2, [1,2])
        @obstacle_bishop_top_right = Bishop.new("white", 2, [1,6])
        @obstacle_bishop_bottom_left = Bishop.new("white", 2, [5,2])
        @obstacle_bishop_bottom_right = Bishop.new("white", 2, [5,6])
        @adjacent_bishop = Bishop.new("white", 2, [2,3])
        @black_bishop = Bishop.new("black", 1)
    end

    context "At creation" do
        it "Should have different symbols if differents colors" do
            expect(@white_bishop_default_pos.symbol).not_to eq @black_bishop.symbol
        end

        it "Should have different position when different color" do
            expect(@white_bishop_default_pos.initial_pos).not_to eq @black_bishop.initial_pos
        end

        it "Should have different position when same color" do
            expect(@white_bishop_default_pos.initial_pos).not_to eq @white_bishop_two_default_pos.initial_pos
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
            expect(bishop_at_center.moves).to eq expected
        end

        it "Should have a correct top right diagonal without obstacle" do
            @board.clear
            @board.add_piece(@white_bishop)
            expected = [
                [3,4],
                [2,5],
                [1,6],
                [0,7]
        ].sort
            expect(@white_bishop.generate_top_right_diagonal(@white_bishop.initial_pos)).to eq expected
        end

        it "Should have a correct top right diagonal with obstacle" do
            @board.clear
            @board.add_piece(@white_bishop_with_obstacle)
            @board.add_piece(@obstacle_bishop_top_right)
            expected = [[2,5]]
            expect(@white_bishop_with_obstacle.generate_top_right_diagonal(@white_bishop_with_obstacle.initial_pos, @board)).to eq expected
        end

        it "Should have a correct top left diagonal without obstacle" do
            @board.clear
            @board.add_piece(@white_bishop)
            expected = [
                [3,2],
                [2,1],
                [1,0]].sort
            expect(@white_bishop.generate_top_left_diagonal(@white_bishop.initial_pos)).to eq expected
        end

        it "Should have a correct top left diagonal with obstacle" do
            @board.clear
            @board.add_piece(@white_bishop_with_obstacle)
            @board.add_piece(@obstacle_bishop_top_left)
            expected = [[2,3]]
            expect(@white_bishop_with_obstacle.generate_top_left_diagonal(@white_bishop_with_obstacle.initial_pos, @board)).to eq expected
        end

        

        it "Should have a correct bottom right diagonal without obstacle" do
            @board.clear
            @board.add_piece(@white_bishop)
            expected = [
                [5,4],
                [6,5],
                [7,6]].sort
            expect(@white_bishop.generate_right_bottom_diagonal(@white_bishop.initial_pos)).to eq expected
        end

        it "Should have a correct bottom right diagonal with obstacle" do
            @board.clear
            @board.add_piece(@white_bishop_with_obstacle)
            @board.add_piece(@obstacle_bishop_bottom_right)
            expected = [[4,5]]
            expect(@white_bishop_with_obstacle.generate_right_bottom_diagonal(@white_bishop_with_obstacle.initial_pos, @board)).to eq expected
        end

        it "Should have a correct bottom left diagonal without obstacle" do
            @board.clear
            @board.add_piece(@white_bishop)
            expected = [
                [5,2],
                [6,1],
                [7,0]].sort
            expect(@white_bishop.generate_left_bottom_diagonal(@white_bishop.initial_pos)).to eq expected
        end

        it "Should have a correct bottom left diagonal with obstacle" do
            @board.clear
            @board.add_piece(@white_bishop_with_obstacle)
            @board.add_piece(@obstacle_bishop_bottom_left)
            expected = [[4,3]]
            expect(@white_bishop_with_obstacle.generate_left_bottom_diagonal(@white_bishop_with_obstacle.initial_pos, @board)).to eq expected
        end

        it "Should return empty array if obstacle is adjacent" do
            @board.clear
            @board.add_piece(@white_bishop_with_obstacle)
            @board.add_piece(@adjacent_bishop)
            expect(@white_bishop_with_obstacle.generate_top_left_diagonal(@white_bishop_with_obstacle.current_pos, @board)).to eq []
        end
    end

    context "At first col" do
        it "Should have a correct moves array" do
            bishop_at_first_col = Bishop.new("black", 1, [3,0])
            expected = [
                [2,1],
                [1,2],
                [0,3],
                [4,1],
                [5,2],
                [6,3],
                [7,4]].sort
            expect(bishop_at_first_col.moves).to eq expected
        end
    end

    context "At last col" do
        it "Should have a correct moves array" do
            bishop_at_last_col = Bishop.new("black", 1, [4,7])
            expected = [
                [3,6],
                [2,5],
                [1,4],
                [0,3],
                [5,6],
                [6,5],
                [7,4]].sort
            expect(bishop_at_last_col.moves).to eq expected
        end
    end

    context "When moving" do
        it "Should be able to move in diagonal" do
            expect(@white_bishop.valid?([4,3], [5,4])).to be true
        end

        it "Should not be able to move in line" do
            expect(@white_bishop.valid?([7,0], [7,3])).to be false
        end

        it "Should change cell value after moving" do
            white_bishop_center = Bishop.new("white", 1, [4,3])
            white_bishop_center.move([5,4])
            expect(white_bishop_center.board.grid[5][4]).to eq white_bishop_center.symbol
        end

        it "Should change current position after moving" do
            white_bishop_center = Bishop.new("white", 1, [1,1])
            white_bishop_center.move([2,2])
            expect(white_bishop_center.current_pos).to eq [2,2]
        end
    end


end