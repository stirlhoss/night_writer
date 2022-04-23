# lib/file_writer.rb
require 'pry'

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

 def write_upcase
   write = @file_write.write(@file_read.read.upcase)
   @file_write.close
   write
 end
end
