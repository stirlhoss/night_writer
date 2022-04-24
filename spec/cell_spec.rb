# cell_spec.rb
require 'pry'
require 'rspec'
require './lib/cell'
require './lib/cellable'

describe Cell do
  it 'exists' do
    letters = Letters.new
  cell = Cell.new('g')

 expect(cell).to be_an_instance_of Cell
  end

  it 'can print a cell of braille' do
    cell = Cell.new('g')

   expect(cell.cell).to eq({
                        1 => [nil, nil],
                        2 => [nil, nil],
                        3 => [nil, nil]
                      })
  end

  it 'can fill cell to match a braille character' do
    cell = Cell.new('a')
    cell.fill('a')

    expect(cell.cell).to eq({
                        1 => ['O', '.'],
                        2 => ['.', '.'],
                        3 => ['.', '.']
                      })
    expect(cell).to be_an_instance_of Cell
  end
end
