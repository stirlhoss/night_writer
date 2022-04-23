# lib/night_writer.rb
require 'pry'
require './lib/file_writer'

file = FileWriter.new

puts "Created '#{ARGV[1]}' containing #{file.write_upcase} characters"
