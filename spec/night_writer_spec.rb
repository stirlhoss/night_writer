# night_writer_spec.rb
require 'simplecov'
SimpleCov.start
require 'rspec'
require 'pry'
require './lib/night_writer'

describe 'night_writer' do
  it 'prints the correct mesage' do
    ARGV = ['message.txt', 'braille.txt']

    expect(lib/night_writer).to eq "Created 'braille.txt' containing 491 characters"
  end
end
