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

describe 'IO' do
  before :each do
    @file = FileReader.new
  end

  it 'reads files' do
    @file.file_path = File.open('message.txt', 'r')

    expect(@file.read).to eq "Here lies the man who's name was writ in hot-dog water.\n"
  end
end
