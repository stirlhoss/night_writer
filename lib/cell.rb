# lib/braille_letter.rb
require 'pry'

class Cell
  def initialize
    @cell = {1 => [nil, nil],
             2 => [nil, nil],
             3 => [nil, nil]}
  end
end
