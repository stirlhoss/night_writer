# lib/file_reader.rb
require 'pry'

class FileReader
  attr_accessor :file_path

  def initialize
    @file_path = File.new(ARGV[0], 'r')
  end

  def read
    @file_path.read
  end
end
