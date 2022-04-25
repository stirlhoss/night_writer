# lib/organiser.rb
require 'pry'
require './lib/row'
require './lib/cell'

#organiser will hold all of the rows and make new rows when a row is full.
class Organiser
  attr_reader :row,
              :org

  def initialize(row)
    @org = [row]
  end

  def make(text)
binding.pry
  end
end
