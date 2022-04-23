# lib/file_reader.rb
require 'pry'

class FileReader
  attr_accessor :file_path

  def initialize
    @file_path = File.new(ARGV[0], 'r')
  end

  def read
    read_file = @file_path.read
    @file_path.close
    read_file
  end
end
