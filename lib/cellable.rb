# lib/cellable.rb

module Cellable

  def make_cell
    Cell.new
    x.fill(x)
  end
end
