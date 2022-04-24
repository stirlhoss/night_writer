# lib/file_writer.rb
require 'pry'
require './lib/cell'

class FileWriter
  attr_accessor :file_read,
                :file_write

 def initialize
   @file_read = File.new(ARGV[0], 'r')
   @file_write = File.new(ARGV[1], 'w')
 end

 def read
   read_file = @file_read.read
   @file_read.close
   read_file
 end

 def read_to_cell
   read_file = @file_read.read.chomp.chars
   read_file.map! { |char| char = Cell.new }
   binding.pry
 end

 def write_upcase
   write = @file_write.write(@file_read.read.upcase)
   @file_write.close
   write
 end
end
