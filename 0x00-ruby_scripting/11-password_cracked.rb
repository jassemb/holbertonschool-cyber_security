require 'digest'

if ARGV.length != 2
  puts "Usage: 11-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit 1
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

begin
  File.open(dictionary_file, "r") do |file|
    file.each_line do |line|
      word = line.strip
      if Digest::SHA256.hexdigest(word) == hashed_password
        puts "Password found: #{word}"
        exit 0
      end
    end
  end

  puts "Password not found in dictionary."
rescue Errno::ENOENT
  puts "Dictionary file not found."
end
