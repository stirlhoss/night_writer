# lib/row.rb
require 'pry'
require './lib/cell'

class Row
  attr_reader :contents

  def initialize
    @contents = []
  end

  def row_fill
    20.times do
      @contents << Cell.new
    end
  end

  def row_full?
    !@contents[19].cell[1][0].nil?
  end

  # each with index
  def cell_update(text)
    target = text.length
    count = 0
    @contents.each do |cell|
      cell.fill(text[count])
      count += 1
      break if count == target
    end
    target
  end

  def row_count(text)
    target_row = text.length / 20
    extra_row = text.length % 20
    if extra_row != 0
      target_row + 1
    else target_row
    end
  end

  def cell_to_row
    read_file = FileWriter.read_to_cell
    @row = Row.make
    @row.cell_update(read_file)
  end

  def arrange_braille
    to_print = { :one => [],
                 :two => [],
                 :three => [] }
    cell_to_row
    # until row_full?
      @row.contents.each do |cell|
        to_print[:one] << cell.cell[1]
        to_print[:two] << cell.cell[2]
        to_print[:three] << cell.cell[3]
      end
    to_print.each do |k, v|
      to_print[k] = v.join + "\n"
    end
  end

  def self.make
    row = Row.new
    row.row_fill
    row
  end
end
