require 'json'

# Function to read JSON file and count userId occurrences
def count_user_ids(filename)
  # Read JSON data from file
  json_data = File.read(filename)
  
  # Parse JSON into a Ruby array of hashes
  data = JSON.parse(json_data)
  
  # Initialize a hash to count userId occurrences
  user_id_count = Hash.new(0)
  
  # Count userId occurrences
  data.each do |item|
    user_id_count[item['userId']] += 1 if item.has_key?('userId')
  end
  
  # Print the userId counts
  user_id_count.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
