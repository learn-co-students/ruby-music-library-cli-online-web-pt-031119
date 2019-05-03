require 'pry'
class MusicImporter
attr_accessor :path

@@all = []
  def initialize(path)
    @path = path
  end

  def files
    @@all << path
  end

  def self.import
  end

end
