# file_writer_spec.rb
require 'rspec'
require 'pry'
require './lib/file_writer'

describe FileWriter do
  it 'exists' do
    file = FileWriter.new

    expect(file).to be_an_instance_of FileWriter
  end
end

describe 'IO' do
  it 'reads files' do
    ARGV = ['message.txt', 'braille.txt']
    write = FileWriter.new

    expect(write.read).to eq "Here lies the man who's name was writ in hot-dog water.\n"
  end

  it 'writes to another file' do
    ARGV = ['message.txt', 'braille.txt']
    write = FileWriter.new

    expect(write.write_upcase).to eq 56
  end

  describe '#read_to_cell' do
    it 'takes in the string from the file and turns each letter into an empty cell' do
    ARGV = ['message1.txt', 'braille.txt']
    write = FileWriter.new
    write.read_to_cell

    expect(write.class).to eq Array
    expect(wirte[0].class).to eq Hash
    end
end
end
