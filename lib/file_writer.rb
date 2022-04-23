# lib/file_writer.rb
require 'pry'
require './lib/file_reader'
require './lib/night_writer'

class FileWriter
  attr_accessor :file_path

  def intitialize
    @file_path = File.new(ARGV[1], 'r')
  end

  def write_file
  end
end
