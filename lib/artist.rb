
require 'pry'
class Artist
  extend Concerns::Findable

attr_accessor :name , :songs

 @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
    
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
    artist = Artist.new(name)
    artist.save
    artist
    
  end
  
  def add_song(song_name)
    song_name.artist = self if song_name.artist.nil?
    @songs << song_name unless @songs.include? song_name
  end
  
 def genres

 songs.collect{ |s| s.genre }.uniq

 end
  
  
  
  
end