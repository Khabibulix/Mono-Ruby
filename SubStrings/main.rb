def substrings(str_to_check="gogo", data_structure_to_seek)
    result = {}
    result[str_to_check] = data_structure_to_seek.count(str_to_check)
    puts result
end



dictionary = ["below","down","go","gogo","going","horn","how", "gaga", "gogo"]

substrings(dictionary)