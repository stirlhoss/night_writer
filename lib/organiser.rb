# lib/organiser.rb
require 'pry'
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
    target_row = text.length / 20
    extra_row = text.length % 20
    if extra_row != 0
      target_row + 1
    else target_row
    end
  end

  def make(text)
    row_count(text).times do
      org << Row.make
    end
  end


end
