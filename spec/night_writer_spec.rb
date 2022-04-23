# night_writer_spec.rb
require 'rspec'
require 'pry'
require 'simplecov'
require './lib/night_writer'

describe 'night_writer' do
  it 'prints the correct mesage' do
    ARGV = ['message.txt', 'upcase.txt']

    expect(lib/night_writer).to eq "Created 'upcase.txt' containing 56 characters"
end
end
