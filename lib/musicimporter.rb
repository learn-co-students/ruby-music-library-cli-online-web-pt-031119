require "pry"

 
class MusicImporter
  
  attr_reader :path
  
  def initialize (path)
    @path = path
  end
  
  def files 
    Dir.entries('./spec/fixtures/mp3s').delete_if do |track|
      track == "." || track == ".."
    end
    
  end
  
  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end
  
end