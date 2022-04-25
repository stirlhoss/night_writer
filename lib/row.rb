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

  def cell_update(text)
    target = text.length
    count = 0
    @contents.each do |cell|
      cell.fill(text[count])
      count += 1
      break if count == target
    end
  end

  def self.make
    row = Row.new
    row.row_fill
    row
  end
end
