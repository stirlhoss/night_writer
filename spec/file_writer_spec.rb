# file_writer_spec.rb
require 'rspec'
require 'pry'
require './lib/file_reader'
require './lib/file_writer'

describe FileWriter do
  it 'exists' do
    file = FileWriter.new

    expect(file).to be_an_instance_of FileWriter
  end
end

describe 'IO' do
  before :each do
    @file = FileReader.new
  end

  it 'reads files and writes into a new file' do
    read = FileReader.new
    write = FileWriter.new
    write.file_path = File.open('message.txt', 'w')

    expect(@file.write_file).to eq "HERE LIES THE MAN WHO'S NAME WAS WRIT IN HOT-DOG WATER.\n"
  end
end
