# file_reader_spec.rb
require 'simplecov'
SimpleCov.start
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
  it 'reads files' do
    ARGV = ['braille.txt', 'b_to_e.txt']
    write = FileReader.new

    expect(write.read).to eq "what do you do with a drunken sailor what do you do with a drunken sailor\n"

  end

  describe 'read_to_cell' do
  it 'reads the message into a hash that resembles a cell' do
    ARGV = ['braille.txt', 'b_to_e.txt']
    write = FileReader.new
    write.read


    expect(write.read_to_cell.class).to eq Hash
  end

  describe 'translate_braille' do
    it 'finds matching letters in alphabet' do
    ARGV = ['braille.txt', 'b_to_e.txt']
    write = FileReader.new
    write.read
    write.read_to_cell

    expect(write.translate_braille).to eq "what would you do"
    end
  end

  end
  describe '#write_braille' do
    it 'takes in english, translates and prints braille' do
      ARGV = ['message2.txt', 'test_braille.txt']
      write = FileReader.new
      message = write.read.chomp
      org = Organiser.new
      org.make(message)

      expect(write.write_braille(org.arrange_print(message))).to eq 368
    end
  end
end
