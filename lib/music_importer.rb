require "pry"
class MusicImporter 
  attr_accessor :path,:file_name
  
  def initialize(path)
    @path = path
  end
  
  def files
   Dir.entries(path).find_all do |file| 
     file.include?(".mp3")
    end
  end
  
  def import 
  #  binding.pry
  files.each {|file| Song.create_from_filename(file)}
  end
  
  
end