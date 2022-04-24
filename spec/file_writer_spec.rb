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
    braille = write.read_to_cell

    expect(braille.class).to eq Array
    expect(braille[0].cell.class).to eq Hash
    end
  end

  describe '#write braille' do
    it 'takes in english, translates and prints braille' do
    ARGV = ['message2.txt', 'braille.txt']
    write = FileWriter.new

    expect(write.write_braille).to eq 1

    end
  end
end
