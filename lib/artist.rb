require 'require_all'
require_all 'lib'

class Artist 
  attr_accessor :name 
  attr_reader :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize (name)
    @name = name 
    @songs = []
  end  #def 
  
  def self.all 
    @@all 
  end     #def 
  
  def self.destroy_all
    all.clear
  end
  
  def save 
    @@all << self 
  end     #def 
  
  def self.create(name)
    artist = self.new(name) #in ruby self is implicit so you just need new(name)
    artist.save 
    artist 
  end     #def 
  
  def add_song(song) #we're passing in an instance of the song class 
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres #this method returns an array of Genre's assoc w/ the song 
    songs.collect do |song|
      song.genre
    end.uniq 
  end     #def 
  
end 


