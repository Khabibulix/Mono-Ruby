def substrings(str_to_check, data_structure_to_seek)
    result = {}
    result[str_to_check] = data_structure_to_seek.count(str_to_check)
    
    for sliced_str in 2...str_to_check.length
        result[str_to_check.slice(0,sliced_str)] = data_structure_to_seek.count(str_to_check.slice(0,sliced_str))
    end

    for sliced_str in -str_to_check.length + 1...0
        result[str_to_check.slice(-sliced_str..)] = data_structure_to_seek.count(str_to_check.slice(-sliced_str..))
    end
    
    puts result
end



dictionary = ["below","gog","down","go","gogo","low","going","horn","how", "gaga", "gogo"]

substrings("below", dictionary)