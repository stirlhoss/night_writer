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

  def self.read_to_cell
    @file_read.read.chomp.chars
  end

  # def cell_to_row
  #   read_to_cell
  #   @row1 = Row.make
  #   @row1.cell_update(@read_file)
  # end

  # def arrange_braille
  #   @to_print = { :one => [],
  #                 :two => [],
  #                 :three => [] }
  #   cell_to_row
  #   @row1.contents.each do |cell|
  #     @to_print[:one] << cell.cell[1]
  #     @to_print[:two] << cell.cell[2]
  #     @to_print[:three] << cell.cell[3]
  #   end
  #   @to_print.each do |k, v|
  #     @to_print[k] = v.join + "\n"
  #   end
  # end

  def write_upcase
    write = @file_write.write(@file_read.read.upcase)
    @file_write.close
    write
  end

  def write_braille
    write = @file_write.write(@to_print.values.join)
    @file_write.close
    write
  end
end
