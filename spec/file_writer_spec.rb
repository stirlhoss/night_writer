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

  describe '#read_to_cell' do
    it 'takes in the string from the file and turns it into an array of characters' do
    ARGV = ['message1.txt', 'braille.txt']
    write = FileWriter.new
    braille = write.read_to_cell

    expect(braille.class).to eq Array
    expect(braille[0].class).to eq String
    end
  end

  describe 'cell_to_row' do
    it 'reads cell value into row' do
    ARGV = ['message1.txt', 'braille.txt']
    write = FileWriter.new
    write.cell_to_row

    expect(write.row1.contents[0].cell).to eq({1=>["O", "."], 2=>["O", "O"], 3=>[".", "."]})
    expect(write.row1.contents[1].cell).to eq({1=>["O", "."], 2=>[".", "O"], 3=>[".", "."]})
    expect(write.row1.contents[2].cell).to eq({1=>["O", "."], 2=>["O", "."], 3=>["O", "."]})
    expect(write.row1.contents[3].cell).to eq({1=>["O", "."], 2=>["O", "."], 3=>["O", "."]})
    expect(write.row1.contents[4].cell).to eq({1=>["O", "."], 2=>[".", "O"], 3=>["O", "."]})
    end
  end

  describe 'arrange_braille' do
    it 'arranges the braille into arrays that can be printed' do
    ARGV = ['message1.txt', 'braille.txt']
    write = FileWriter.new
    write.arrange_braille

    expect(write).to eq Hash
    
    end
  end

  describe '#write_braille' do
    it 'takes in english, translates and prints braille' do
    ARGV = ['message2.txt', 'test_braille.txt']
    write = FileWriter.new
    write.arrange_braille
    write.write_braille

    expect(ARGV[1]).to eq "O.OO.."
    end
  end
end
