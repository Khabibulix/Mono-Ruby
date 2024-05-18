require 'json'
require "#{Dir.pwd}/lib/utilities"

class Game
    attr_reader :word, :current_word_for_save, :hidden_word, :remaining_guesses, :choosed_letters        
    def initialize
        @word = choose_word
        @hidden_word = display_hidden_word
        @current_word_for_save = ""
        @remaining_guesses = 10
        @choosed_letters = []
    end

    def init_game

        p "Do you want to load a game? y/n"
        load_input = gets.chomp
        check_input(load_input, loading_game)
        datas = loading_game
        @hidden_word = datas[0]
        @word = datas[1]
        @remaining_guesses = datas[2]
        datas[3].each {|letter| @choosed_letters.push(letter)}
        
        if load_input != "y"
            stock_words_of_correct_size
            choose_word
        end

        p "Here is the current word to guess\n"
        p @hidden_word
    end

    def play_round
        input = get_input_from_user            
        replacing_letter(@word, @hidden_word, input)

        p "You already choosed: #{@choosed_letters.uniq.join(", ")}"        
        p "Would you like to save the current progress? y/n"
        save_input = gets.chomp
        check_input(save_input, saving_game)
        
    end

    def game_finished?(hw=@hidden_word)
        if hw.chars.none?("_")
            p "Great, you beat the game!"
            return true
        elsif @remaining_guesses == 0
            p "Sorry, no more guesses, you lose!"
            return true
        end
        return false
    end    


    def display_hidden_word(word=@word)
        word_hidden = ""
        (0...word.length).each {word_hidden += "_"}
        word_hidden
    end

    def edit_hidden_word(word=@hidden_word, index, new_value)
        word[index] = new_value
    end
    
    

    def replacing_letter(word=@word,hw=@hidden_word, letter)
        if input_in_word?(word,letter)
            indexes_of_letter = get_indexes_for_letter(word,letter)
            indexes_of_letter.each do|index| 
                edit_hidden_word(hw, index, letter)
            end
            p "The word is #{hw}"
            @current_word_for_save = hw
            @choosed_letters.push(letter)
            hw
        else
            if !@choosed_letters.include?(letter)
                @remaining_guesses -= 1
            end
            @choosed_letters.push(letter)
        end
    end   
    

    def saving_game
        data = {
            current_word: @current_word_for_save,
            word: @word,
            guesses: @remaining_guesses,
            letters: @choosed_letters
        }

        File.open("#{Dir.pwd}/data/save.json", "w") do |file|
            file.write(data.to_json)
        end
    end

    def loading_game
        file = File.open("#{Dir.pwd}/data/save.json")
        data = JSON.load file
        data.values
    end

end


