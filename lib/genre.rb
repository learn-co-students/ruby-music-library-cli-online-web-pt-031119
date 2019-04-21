
class Genre
  attr_accessor :name 
  attr_reader :songs
  
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods
  
  @@all = []
  
  def initialize (name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
  
end