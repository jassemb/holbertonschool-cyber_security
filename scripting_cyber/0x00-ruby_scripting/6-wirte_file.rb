# 6-write_in_file.rb

require 'json'

# Function to merge JSON objects from one file into another
def merge_json_files(file1_path, file2_path)
  # Read and parse source file
  source_file = File.read(file1_path)
  source_data = JSON.parse(source_file)

  # Read and parse destination file
  if File.exist?(file2_path)
    destination_file = File.read(file2_path)
    destination_data = JSON.parse(destination_file)
  else
    destination_data = []
  end

  # Merge the arrays
  merged_data = destination_data + source_data

  # Write the merged data back to the destination file
  File.open(file2_path, 'w') do |file|
    file.write(JSON.pretty_generate(merged_data))
  end

  puts "Merged #{source_data.size} entries from #{file1_path} into #{file2_path}."
end
