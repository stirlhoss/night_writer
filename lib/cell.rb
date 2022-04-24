# lib/cell.rb
require 'pry'
require './lib/letters'
require './lib/cellable'

class Cell
  include Cellable
  attr_reader :cell,
              :alphabet,
              :name

  def initialize(name)
    @name = name
    @cell = {1 => [nil, nil],
             2 => [nil, nil],
             3 => [nil, nil]}
    @alphabet = Letters.new
  end

  def fill(letter)
  cell_map = letter.intern
  cell[1] = @alphabet.letters[cell_map][1]
  cell[2] = @alphabet.letters[cell_map][2]
  cell[3] = @alphabet.letters[cell_map][3]
  end
end
