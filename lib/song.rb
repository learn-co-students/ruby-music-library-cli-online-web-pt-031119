require "pry"

class Song 
  attr_accessor :name, :artist
  attr_reader :genre
  
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  
  @@all = []
  
  def initialize (name, artist=nil, genre=nil)
    @name = name
    self.artist= artist if artist
    @genre = genre
  end
  
  def self.all 
    @@all 
  end
  
  def artist= name
    name.add_song(self)
  end
  
  def genre= (genre)
     @genre = genre
     genre.songs << self unless genre.songs.include?(self)
  end

end