# lib/file_writer.rb
require 'pry'
require './lib/cell'
require './lib/row'

class FileWriter
  attr_accessor :file_read,
                :file_write,
                :read_file,
                :row1,
                :row2,
                :row3

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

  def read_to_cell
    @read_file = @file_read.read.chomp.chars
    # @read_file.map! do |char|
    #   cell = Cell.new
    #   cell.fill(char)
    #   cell.cell
  # end
  end

  def cell_to_row
    read_to_cell
    @row1 = Row.make
    @row1.cell_update(@read_file)
  end

  def write_upcase
    write = @file_write.write(@file_read.read.upcase)
    @file_write.close
    write
  end

  def write_braille
    write = @file_write.write(read_to_cell[0].values.join)
    @file_write.close
    write
  end
end
