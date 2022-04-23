# night_writer_spec.rb
require 'pry'
require 'simplecov'
require './lib/night_writer'

describe 'night_writer' do
  it 'reads the first file that it takes in' do
    file = File.open('message.txt', 'r')

    expect(file.read).to eq "Here lies the man who's name was writ in hot-dog water.\n"
  end
end
