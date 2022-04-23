# night_writer_spec.rb
require 'rspec'
require 'pry'
require 'simplecov'
require './lib/night_writer'

describe 'night_writer' do
  it 'exists' do
    file = NightWriter.new

    expect(file).to be_an_instance_of NightWriter
  end

  it 'reads the first file that it takes in' do
    ARGV = ['message.txt', 'braille.txt']
    file = NightWriter.new

    expect(file.read).to eq "Here lies the man who's name was writ in hot-dog water.\n"
  end

  it 'writes into the second file given' do
    ARGV = ['message.txt', 'braille.txt']
    file = NightWriter.new

    expect(file.write_upcase).to eq "HERE LIES THE MAN WHO'S NAME WAS WRIT IN HOT-DOG WATER.\n"
  end
end
