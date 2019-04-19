require "pry"

class Artist
  
  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  
  @@all = []
  
  def initialize (name)
    @name = name
    @songs = []
  end
  
   def self.all 
    @@all 
  end

  def add_song (song)
    if song.artist == nil 
    song.artist = self
    end
    if !@songs.include?(song)
    @songs << song
    end
  end
  
  def genres
    Song.all.collect do |song|
     if song.artist == self
       binding.pry
       song.genre
     end
    end
  end

end