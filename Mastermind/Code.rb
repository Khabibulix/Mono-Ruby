CHOICES = ["yellow", "black", "red", "blue", "green"]

code = []

for iter in 0...CHOICES.length
    code[iter] = CHOICES.sample
end

p code
