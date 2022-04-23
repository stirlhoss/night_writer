# lib/night_writer.rb
require 'pry'
require './lib/file_reader'

class NightWriter
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
end
