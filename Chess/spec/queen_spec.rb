# require_relative '../lib/pieces/queen'
# require_relative '../lib/board'

# describe "A Queen in general" do
#     before(:all) do
#         @white_queen = Queen.new("white")
#         @black_queen = Queen.new("black")
#         @queen_at_center = Queen.new("black", 1 , [4,3])
#         @queen_at_first_col = Queen.new("black", 1,  [3,0])
#         @board = Board.new
#     end

#     context "At creation" do
#         it "Should have differents symbols if differents colors" do           
#             expect(@white_queen.symbol).not_to eq @black_queen.symbol
#         end

#         it "Should have different position when different color" do
#             expect(@white_queen.initial_pos).not_to eq @black_queen.initial_pos
#         end
#     end

#     context "At center" do
#         xit "Should have a correct moves array" do
#             @board.clear
#             @board.add_piece(@queen_at_center)
#             expected = [
#                 [3,2],
#                 [2,1],
#                 [1,0],
#                 [5,2],
#                 [6,1],
#                 [7,0],
#                 [3,4],
#                 [2,5],
#                 [1,6],
#                 [0,7],
#                 [5,4],
#                 [6,5],
#                 [7,6],
#                 [0,3],
#                 [1,3],
#                 [2,3],
#                 [3,3],
#                 [5,3],
#                 [6,3],
#                 [7,3],
#                 [4,0],
#                 [4,1],
#                 [4,2],
#                 [4,4],
#                 [4,5],
#                 [4,6],
#                 [4,7]].sort
#             expect(@queen_at_center.generate_moves(@board)).to eq expected
#         end
#     end

#     context "At first col" do
#         it "Should have a correct moves array" do
            
#             expected = [
#                 [2,1],
#                 [1,2],
#                 [0,3],
#                 [4,1],
#                 [5,2],
#                 [6,3],
#                 [7,4],
#                 [0,0],
#                 [1,0],
#                 [2,0],
#                 [4,0],
#                 [5,0],
#                 [6,0],
#                 [7,0],
#                 [3,1],
#                 [3,2],
#                 [3,3],
#                 [3,4],
#                 [3,5],
#                 [3,6],
#                 [3,7]].sort
#             expect(@queen_at_first_col.moves).to eq expected
#         end
#     end

#     context "When moving" do
#         it "Should be able to move in diagonal" do
#             expect(@queen_at_center.valid?([4,3], [5,4])).to be true
#         end

# #         it "Should be able to move in line too" do
# #             expect(@queen_at_center.valid?([6,3])).to be true
# #         end

#         it "Should change cell value after moving" do
#             @queen_at_center.move([5,4])
#             expect(@queen_at_center.board.grid[5][4]).to eq @queen_at_center.symbol
#         end

#         it "Should change current position after moving" do
#             @board.clear
#             @board.add_piece(@queen_at_center)
#             @queen_at_center.move([5,4])
#             expect(@queen_at_center.current_pos).to eq [5,4]
#         end
#     end
# end