# lib/file_reader.rb

require 'pry'
require './lib/row'
require './lib/organiser'

class FileReader
  attr_accessor :file_read,
                :file_write,
                :read_file,
                :message

  def initialize
    @file_read = File.new(ARGV[0], 'r')
    @file_write = File.new(ARGV[1], 'w')
  end

  def read
    @read_file = @file_read.read
    @file_read.close
    @read_file
  end

  def read_to_cell
    index = 0
    braille_cells = Hash.new
    characters = @read_file.chars
    c = characters - ["\n"]
    elements = c.each_slice(2).to_a
    character_count = elements.length / 3
    shifter = 0
    4.times do
      20.times do
      braille_cells[shifter] = {1 => elements.fetch(index + 0),
                              2 => elements.fetch(index + 20),
                              3 => elements.fetch(index + 40)}
      shifter += 1
      index += 1
      end
      index += 40
    end
    braille_cells
  end

  def translate_braille
    alphabet = Letters.new
    braille_cells = read_to_cell
    alphabet_array = Array.new
    braille_cells.each do |index, cell|
      letter = alphabet.letters.find { |k,v| v == braille_cells[index]}
      alphabet_array << letter
    end
    alphabet_array.map! do |letter|
      letter[0]
    end
    message = alphabet_array.join
    message.rstrip
  end

  def write_english(message)
    write = @file_write.write(message)
    @file_write.close
    write
  end
end
