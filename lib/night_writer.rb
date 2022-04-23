# lib/night_writer.rb
require 'pry'
require './lib/file_reader'

handle = File.open(ARGV[0], 'r')
text = handle.read
handle.close
puts text
