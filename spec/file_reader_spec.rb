# file_reader_spec.rb
require 'rspec'
require 'pry'
require './lib/file_reader'

describe FileReader do
  it 'exists' do
    file = FileReader.new

    expect(file).to be_an_instance_of FileReader
  end
end
