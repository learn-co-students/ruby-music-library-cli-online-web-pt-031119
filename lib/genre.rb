class Genre
extend Concerns::Findable
attr_accessor :name, :songs

 @@all = []
  def initialize(name)
    @name = name
    @songs = []
    #@@all << self
  end

def self.all
  @@all
end

  def self.destroy_all
    @@all.clear
  end
  
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = Genre.new(name)
    artist.save
    artist
    
  end
  
 def artists
    #binding.pry
    songs.collect{ |s| s.artist }.uniq

 end

  
  
end