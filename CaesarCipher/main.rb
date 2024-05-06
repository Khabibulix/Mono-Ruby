
def caesar_cipher(str_to_encrypt, number_of_rotations=2)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    encrypted_str = ""
    str_to_encrypt.each_char do |char|
        if alphabet.include?(char.downcase)
            current_index_of_letter = alphabet.index(char.downcase)
            new_index_of_letter = current_index_of_letter - number_of_rotations
            encrypted_str += alphabet[new_index_of_letter]
        else
            encrypted_str += char
        end
    end
    puts encrypted_str
end

caesar_cipher("abc!", 5)