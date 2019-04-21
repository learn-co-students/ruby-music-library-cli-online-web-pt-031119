require "pry"

class Artist
  
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

  def add_song (song)
    song.artist = self unless song.artist == self
    if !@songs.include?(song)
    @songs << song
    end
  end
  
  def genres
    @songs.collect do |song| 
      song.genre
     end.uniq
  end


end