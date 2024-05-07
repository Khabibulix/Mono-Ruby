exercise_array = [4,3,78,2,0,2]
$number_of_swaps = 0

def bubble_sort(array_to_sort, idx=0)
    actual_element = array_to_sort[idx]
    next_element = array_to_sort[idx + 1]   
    
    if next_element != nil
        if actual_element > next_element
            array_to_sort[idx + 1] = actual_element
            array_to_sort[idx] = next_element
            $number_of_swaps += 1
            bubble_sort(array_to_sort, idx+1)
        else
            bubble_sort(array_to_sort, idx+1)
        end
    else
        if $number_of_swaps == 0
            p array_to_sort
        else
            $number_of_swaps = 0
            bubble_sort(array_to_sort)
        end
    end

    
end

bubble_sort(exercise_array)