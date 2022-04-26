# lib/cell.rb
require 'pry'
require './lib/letters'

class Cell
  attr_reader :cell

  def initialize
    @cell = { 1 => [nil, nil],
              2 => [nil, nil],
              3 => [nil, nil] }
  end

  def fill(letter)
    exit if letter.nil?
    alphabet = Letters.new
    cell[1] = alphabet.letters[letter][1]
    cell[2] = alphabet.letters[letter][2]
    cell[3] = alphabet.letters[letter][3]
  end
end
