# lib/file_writer.rb
require 'pry'
require './lib/cell'
require './lib/row'

class FileWriter
  attr_accessor :file_read,
                :file_write,
                :read_file,
                :message

  def initialize
    @file_read = File.new(ARGV[0], 'r')
    @file_write = File.new(ARGV[1], 'w')
  end

  def read
    read_file = @file_read.read
    @file_read.close
    read_file
  end

  def read_write_file
    read_file = @file_write.read
    @file_write.close
    read_file
  end

  def self.read_to_cell
    @message = @file_read.read.chomp.chars
  end

  def write_braille
    write = @file_write.write(@to_print.values.join)
    @file_write.close
    write
  end
end
