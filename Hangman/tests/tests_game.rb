require "#{Dir.pwd}/lib/game"
require 'minitest/autorun'

class Test < Minitest::Test
    def setup
        @game = Game.new
    end

    def test_stock_words_return
        assert_instance_of(Array, @game.stock_words_of_correct_size)
    end

    def test_choose_word
        assert_includes(@game.stock_words_of_correct_size, @game.choose_word)
    end

    def test_display_hidden_word
        assert_equal(@game.display_hidden_word.length, @game.word.length)
    end

    def test_true_is_input_in_word_for_e
        assert(@game.input_in_word?("esperanza", "e"))
    end

    def test_true_is_input_in_word_for_a
        assert(@game.input_in_word?("esperanza", "a"))
    end

    def test_false_is_input_in_word?
        assert(!@game.input_in_word?("asparanza", "e"))
    end

    def test_get_all_index_for_letter_e
        assert_equal([0, 3], @game.get_indexes_for_letter("esperanza", "e"))
    end

    def test_get_all_index_for_letter_a
        assert_equal([5,8], @game.get_indexes_for_letter("esperanza", "a"))
    end

    def test_get_all_index_for_random_word
        if @game.input_in_word?("e")
            assert(@game.get_indexes_for_letter("e").length > 0)
        end
    end

    def test_replacing_letter
        hidden_word = @game.display_hidden_word("esperanza")
        assert_equal("e__e_____", @game.replacing_letter("esperanza",hidden_word,"e"))
    end

    def test_replacing_letter_add_to_guesses
        hidden_word = @game.display_hidden_word("esperanza")
        @game.replacing_letter("esperanza",hidden_word,"e")
        assert(@game.choosed_letters.length > 0)
    end

    def test_incorrect_replacing_letter_increments_incorrect_guesses
        hidden_word = @game.display_hidden_word("esperanza")
        @game.replacing_letter("esperanza",hidden_word, "y")
        assert(@game.remaining_guesses != 5)
    end

    def test_game_finished?
        hidden_word = "esperanza"
        assert(@game.game_finished?(hidden_word))
    end

    def test_shitty_game_finished?
        hidden_word = "esper_nza"
        assert(!@game.game_finished?(hidden_word))
    end

end