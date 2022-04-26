# cell_spec.rb
require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/cell'

describe Cell do
  it 'exists' do
    letters = Letters.new
    cell = Cell.new

    expect(cell).to be_an_instance_of Cell
  end

  it 'can print a cell of braille' do
    test = Cell.new

    expect(test.cell).to eq({
                              1 => [nil, nil],
                              2 => [nil, nil],
                              3 => [nil, nil]
                            })
  end

  it 'can fill cell to match a braille character' do
    test = Cell.new
    test.fill('a')

    expect(test.cell).to eq({
                              1 => ['O', '.'],
                              2 => ['.', '.'],
                              3 => ['.', '.']
                            })
    expect(test).to be_an_instance_of Cell
  end

  it 'can will exit when asked to fill a nil cell' do
    test1 = Cell.new
    test1.fill(nil)

    expect(test1).to eq({
                          1 => [nil, nil],
                          2 => [nil, nil],
                          3 => [nil, nil]
                        })
  end
end
