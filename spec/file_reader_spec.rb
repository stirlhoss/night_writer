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

    expect(write.read).to eq ".OO.O..O..OOO...OOO.O...OOO....O.O.OO...\nOOOO..OO...O.O...O.O.....O.O..OOO.OOOO..\n.O....O.....O...OOO.OO....O....O..O.....\nO...OOO.O.OOO.O.OO...OO..OO.O.O....OO.O.\n.....OOO...O...O.O..O...O.O..OOO..OOOO..\n......O.OOO.O...O...O.....O.O.O....O....\n.O..OOO...OOO.O...OOO....O.O.OO...O...OO\nOO...O.O...O.O.....O.O..OOO.OOOO.......O\nO.....O...OOO.OO....O....O..O...........\nO.O.OOO.O.OO...OO..OO.O.O...............\nOO...O...O.O..O...O.O..OOO..............\nO.OOO.O...O...O.....O.O.O..............."

  end

  describe 'read_to_cell' do
  it 'reads the message into a hash that resembles a cell' do
    ARGV = ['braille.txt', 'b_to_e.txt']
    write = FileReader.new
    write.read


    expect(write.read_to_cell.class).to eq Hash
    expect(write.read_to_cell[0]).to eq({1=>[".", "O"], 2=>["O", "O"], 3=>[".", "O"]})
    expect(write.read_to_cell[12]).to eq({1=>["O", "O"], 2=>[".", "O"], 3=>[".", "."]})
  end

  describe 'translate_braille' do
    it 'finds matching letters in alphabet' do
    ARGV = ['braille.txt', 'b_to_e.txt']
    write = FileReader.new
    write.read
    write.read_to_cell

    expect(write.translate_braille).to eq "what do you do with a drunken sailor what do you do with a drunken sailor"
    end
  end

  end
  describe '#write_english' do
    it 'takes in braille, translates and prints english' do
      ARGV = ['braille.txt', 'b_to_e.txt']
      file = FileReader.new
      message = file.read

      expect(file.write_english(file.translate_braille)).to eq 73
    end
  end
end
