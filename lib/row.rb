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
      cell.fill(text.shift)
      count += 1
      break if count == target
    end
    target
  end

  def row_count(text)
    @target_row = text.length / 20
    extra_row = text.length % 20
    if extra_row != 0
      @target_row + 1
    end
    @target_row
  end

  def self.make
    row = Row.new
    row.row_fill
    row
  end
end
