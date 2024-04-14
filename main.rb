require 'json'
require './Server.rb'

print_text = ""
File.open(path="./data/print", mode="r") do |file|
  file.each do |text|
    print_text += text
  end
end

puts print_text

reading = Server.new
while true
  print "Server setting path $ "
  path = gets.chomp!
  if path == "exit"
    exit
  end
  root_path = reading.scan(path)
  puts "Root_Path: #{root_path}"
  reading.server_start root_path
end