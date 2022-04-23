# lib/cell.rb
require 'pry'

class Cell
  attr_reader :cell

  def initialize
    @cell = {1 => [nil, nil],
             2 => [nil, nil],
             3 => [nil, nil]}
  end

  def fill(letter)
    cell[1] = ['O', '.']
    cell[2] = ['.', '.']
    cell[3] = ['.', '.']
  end
end
