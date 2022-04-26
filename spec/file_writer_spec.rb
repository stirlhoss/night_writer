# file_writer_spec.rb
require 'simplecov'
SimpleCov.start
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
    ARGV = ['message.txt', 'test_braille.txt']
    write = FileWriter.new

    expect(write.read).to eq "what do you do with a drunken sailor what do you do with a drunken sailor\n"
  end

  describe '#write_braille' do
    it 'takes in english, translates and prints braille' do
      ARGV = ['message2.txt', 'test_braille.txt']
      write = FileWriter.new
      message = write.read.chomp
      org = Organiser.new
      org.make(message)

      expect(write.write_braille(org.arrange_print(message))).to eq 368
    end
  end
end
