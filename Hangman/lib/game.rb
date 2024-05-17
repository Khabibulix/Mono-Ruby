class Game
    attr_reader :word, :hidden_word, :remaining_guesses, :choosed_letters        
    def initialize
        @word = choose_word
        @hidden_word = display_hidden_word
        @remaining_guesses = 5
        @choosed_letters = []
    end

    def stock_words_of_correct_size
        wordlist = File.new("#{Dir.pwd}/data/wordlist.txt")

        if File.exist? wordlist
            lines = wordlist.readlines
            playable_words = []
            lines.each do |line|
                playable_words.push(line.chomp)
            end
            playable_words.select! {|item| item.length < 12 && item.length > 5}
        end
        playable_words
    end

    def choose_word
        stock_words_of_correct_size.sample
    end

    def display_hidden_word(word=@word)
        word_hidden = ""
        (0...word.length).each {word_hidden += "_"}
        word_hidden
    end

    def edit_hidden_word(word=@hidden_word, index, new_value)
        word[index] = new_value
    end

    def get_input_from_user
        puts "Choose a letter:\n" #Attention à bien checker qu'on a une lettre!
        gets.chomp
    end

    def is_input_in_word?(word=@word, letter)
        word.include?(letter)
    end

    def get_indexes_for_letter(word=@word,letter)
        word.chars.each_with_index.select{|c, i| c == letter}.map(&:last)
    end

    def replacing_letter(word=@word,hw=@hidden_word, letter)
        if is_input_in_word?(word,letter)
            indexes_of_letter = get_indexes_for_letter(word,letter)
            indexes_of_letter.each do|index| 
                edit_hidden_word(hw, index, letter)
                @choosed_letters.push(letter)
            end
            hw
        else
            @remaining_guesses -= 1
            @choosed_letters.push(letter)
        end
    end

end



# game = Game.new()
# p game.choose_word
# p game.is_input_in_word?("e")
# p game.get_all_index_for_letter("e")
# word = game.choose_word
# p word
# p word.include?("e")