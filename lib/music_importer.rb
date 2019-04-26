class MusicImporter 
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
   Dir.entries(path).find_all do |file| 
     file.include?(".mp3")
    end
  end
  
  
  
end