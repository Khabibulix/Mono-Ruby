content = File.read("event_attendees.csv") if File.exist? "event_attendees.csv"
lines = File.readlines("event_attendees.csv")
lines.each do |line|
    columns = line.split(",")
    next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
    name = columns[2]
    puts name
end