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
    @songs << song
  end
  
  def genres
    self.songs.collect do |song|
      song.genre
      binding.pry
    end
  end

end