# lib/file_writer.rb
require 'pry'
require './lib/cell'

class FileWriter
  attr_accessor :file_read,
                :file_write,
                :read_file

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
   @read_file = @file_read.read.chomp.chars
   @read_file.map! do |char|
     char = Cell.new(char)
   end
   @read_file.each do |cell|
     cell.fill(cell.name)
   end
 end

 def write_upcase
   write = @file_write.write(@file_read.read.upcase)
   @file_write.close
   write
 end
end
