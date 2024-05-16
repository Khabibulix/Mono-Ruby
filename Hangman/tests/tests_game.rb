require "#{Dir.pwd}/lib/game"
require 'minitest/autorun'

class Test < Minitest::Test
    def setup
        @game = Game.new
    end

    def test_stock_words
        assert_instance_of(Array, @game.stock_words_of_correct_size)
    end
end