def stock_words_of_correct_size
    wordlist = File.new(Dir.pwd + "/wordlist.txt")

    if File.exist? wordlist
        lines = wordlist.readlines
        playable_words = []
        lines.each do |line|
            playable_words.push(line.chomp)
        end
        playable_words.select {|item| item.length < 12 && item.length > 5}
    end
    playable_words
end

p stock_words_of_correct_size