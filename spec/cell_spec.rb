# cell_spec.rb
require 'pry'
require 'rspec'
require './lib/cell'

describe Cell do
  it 'exists' do
  cell = Cell.new

 expect(cell).to be_an_instance_of Cell
  end
end
