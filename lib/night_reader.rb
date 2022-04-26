# lib/night_reader.rb
require 'pry'
require './lib/file_Reader'

file = FileReader.new
message = file.read.chomp
e = file.write_english(file.translate_braille)

puts "Created '#{ARGV[1]}' containing #{e} characters"
