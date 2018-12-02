# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#assuming that log_file.txt will be provided 
#creating Room, Person and PersonRoomVisit from each entry of log file
#replace content of log_file.txt with actual log file content
#right now I am taking 2nd sample example as a log_file.txt content
input_file1 = File.open("log_file.txt")
total_lines = input_file1.first.split("\n").first.to_i
#destroying all the old data from all the tables before inserting new one
PersonRoomVisit.destroy_all
Room.destroy_all
Person.destroy_all

#parsing the log file , and populating each log line content to the tables
File.open("log_file.txt", "r") do |file_handle|
  file_handle.each_line.with_index(1) do |line, index|
    break if index == (total_lines * 2 + 1)
    next if line.blank? || index == 1 #in log file first line denoting the number of log line that's why skipping
    raw_text = line.split(" ") #each log line 4 parameters are given saperated by space
    room_number = raw_text[1] #2nd parameter is room number
    person_id = raw_text[0]   #1st parameter is room_id
    in_time =  raw_text[2] == 'I' ? raw_text[3].to_i : nil #3rd and 4th parameters giving in_time or out_time info
    out_time = raw_text[2] == 'O' ? raw_text[3].to_i : nil
    time_spent = nil
    
    room = Room.find_or_create_by(room_no: room_number)
    person = Person.find_or_create_by(person_id: person_id)
    person_room_visit = PersonRoomVisit.find_or_create_by(person_id: person.id, room_id: room.id)
    if person_room_visit.in_time.present?
      time_spent = (out_time - person_room_visit.in_time + 1)
      person_room_visit.update(out_time: out_time, time_spent: time_spent)
    else
      person_room_visit.update(in_time: in_time)
    end
    
  end
end

#populating total_persons_visited and avg_time_spent for each room
Room.find_in_batches.each do |rooms|
  rooms.each do |room|
    person_room_visits = PersonRoomVisit.where(room_id: room.id)
    total_persons = person_room_visits.pluck(:person_id).uniq.count

    avg_time_spent = total_persons > 1 ? (person_room_visits.sum("time_spent") / total_persons) : person_room_visits.sum("time_spent")
    room.update(total_persons_visited: total_persons, avg_time_spent: avg_time_spent)
  end
end