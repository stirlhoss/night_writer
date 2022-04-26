# lib/organiser.rb
require 'pry'
require './lib/file_writer'
require './lib/row'
require './lib/cell'

#organiser will hold all of the rows and make new rows when a row is full.
class Organiser
  attr_reader :rows,
              :org

  def initialize
    @org = []
  end

  def rows
    org.length
  end

   def row_count(text)
    @target_row = text.length / 20
    extra_row = text.length % 20
    if extra_row != 0
      @target_row = @target_row + 1
    else @target_row
    end
  end

  def make(text)
    row_count(text).times do
      org << Row.make
    end
  end

  def cell_to_row
    read_file = FileWriter.read_to_cell
    @row = Row.make
    @row.cell_update(read_file)
  end

  def extend_cell_to_row(message)
    array = message.chars
    org.each do |row|
      row.cell_update(array)
    end
  end

  def arrange_braille(message)
    @to_print = { :one => [],
                 :two => [],
                 :three => [] }
    extend_cell_to_row(message)
    # until row_full?
    org.each do |row|
      row.contents.each do |cell|
        @to_print[:one] << cell.cell[1]
        @to_print[:two] << cell.cell[2]
        @to_print[:three] << cell.cell[3]
      end
    end
  end

  def arrange_print(message)
    print_array = []
    @target_row.times do
      @to_print.each do | k, v |
        print_array << v.shift(20)
      end
    end
    print_array.join.scan(/.{20}|.+/).join("\n")
  end
end
