require_relative 'lib/player'
require_relative 'lib/board'


player = Player.new
board = Board.new
game = Game.new

PLAYER_SYMBOL = player.symbol
COMPUTER_SYMBOL = player.adversary_symbol

game.welcome_player
