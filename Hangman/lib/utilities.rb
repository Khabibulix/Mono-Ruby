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

def input_in_word?(word, letter)
    word.include?(letter)
end

def get_indexes_for_letter(word,letter)
    word.chars.each_with_index.select{|c, i| c == letter}.map(&:last)
end