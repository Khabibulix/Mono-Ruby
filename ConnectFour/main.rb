require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'


player = Player.new
board = Board.new
game = Game.new

PLAYER_SYMBOL = player.symbol
COMPUTER_SYMBOL = player.adversary_symbol

game.welcome_player
puts "Grid is currently like this: \n\n"
board.display



until board.get_non_empty_nodes.length == 42        
    input = game.get_input
    board.add(input, PLAYER_SYMBOL)
    board.display
    puts "The computer is playing... Here is the grid now: \n \n"
    computer_input = game.get_computer_choice
    board.add(computer_input, COMPUTER_SYMBOL)
    board.display
    return "You lose" if board.victory?(COMPUTER_SYMBOL)
    return "You win" if board.victory?(PLAYER_SYMBOL)
end