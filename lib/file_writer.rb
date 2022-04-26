# lib/file_writer.rb
require 'pry'
require './lib/organiser'

class FileWriter
  attr_accessor :file_read,
                :file_write,
                :read_file

  def initialize
    @file_read = File.new(ARGV[0], 'r')
    @file_write = File.new(ARGV[1], 'w')
  end

  def read
    @read_file = @file_read.read
    @file_read.close
    @read_file
  end

  def write_braille(message)
    write = @file_write.write(message)
    @file_write.close
    write
  end
end
