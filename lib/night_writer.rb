# lib/night_writer.rb
require 'pry'
require './lib/file_writer'

file = FileWriter.new
message = file.read.chomp
org = Organiser.new
org.make(message)
e = file.write_braille(org.arrange_print(message)).to_s

puts "Created '#{ARGV[1]}' containing #{e} characters"
