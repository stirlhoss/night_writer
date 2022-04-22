# lib/file_reader.rb

class FileReader
  def initialize
    @file_path = File.new(ARGV[0], 'r')
  end
end
