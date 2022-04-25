# row_spec.rb

require 'pry'
require 'rspec'
require './lib/cell'
require './lib/row'

describe Row do
  it 'exists' do
    row = Row.new

    expect(row).to be_an_instance_of Row
    expect(row.contents).to eq []
  end

  it 'can fill row wil nil cells' do
    row = Row.new
    row.row_fill

    expect(row.contents.length).to eq 20
    expect(row.contents[0].cell).to eq({
                                         1 => [nil, nil],
                                         2 => [nil, nil],
                                         3 => [nil, nil]
                                       })

  end

  it 'can update a cell based on an array' do
    row = Row.new
    row.row_fill
    message = ['h','e','l','l','o']
    row.cell_update(message)

    expect(row.contents[2].cell).to eq({1=>["O", "."], 2=>["O", "."], 3=>["O", "."]})
    expect(row.contents[4].cell).to eq({1=>["O", "."], 2=>[".", "O"], 3=>["O", "."]})
  end

  it 'has a method that returns boolean if row is full' do
    row = Row.new
    row.row_fill

    expect(row.row_full?).to eq false

    row.contents[19].fill('g')

    expect(row.row_full?).to eq true
  end

  it 'can make new rows' do
    row = Row.make

    expect(row).to be_an_instance_of Row
    expect(row.contents.length).to eq 20
    expect(row.contents[0].cell).to eq({
                        1 => [nil, nil],
                        2 => [nil, nil],
                        3 => [nil, nil]
                      })

  end
end
