
def caesar_cipher(str_to_encrypt, number_of_rotations=2)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    str_to_encrypt.each_char do |char|
        if alphabet.include?(char.downcase)
            puts char
        else
            puts char
        end
    end
end

caesar_cipher("Test!")