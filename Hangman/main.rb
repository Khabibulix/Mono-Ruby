require "#{Dir.pwd}/lib/game"

game = Game.new()
game.init_game

while !game.game_finished?
    game.play_round
end

