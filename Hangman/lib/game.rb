class Game
    attr_reader :word, :incorrect_guess, :choosed_letters        
    def initialize
        @word = choose_word
        @incorrect_guesses = 5
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
        wordlist = stock_words_of_correct_size
        wordlist.sample
    end

    def display_hidden_word
        word_hidden = ""
        (0...@word.length).each {word_hidden += "_"}
        word_hidden
    end
end



game = Game.new()
p game.display_hidden_word