require "pry"

 
class MusicImporter
  
  attr_reader :path
  
  def initialize (path)
    @path = path
  end
  
  def files 
    Dir.entries(@path).delete_if do |track|
      track == "." || track == ".."
    end
    
  end
  
  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end
  
end