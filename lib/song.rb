
class Song 
  attr_accessor :name, :artist
  attr_reader :genre
  
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  
  @@all = []
  
  def initialize (name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
  end
  
  def self.all 
    @@all 
  end
  
  def genre= (genre)
   genre.songs.each do |songs|
     if songs == self
       "This song already has a genre"
     else
     @genre << genre
     genre.songs << self
    end
  
  end
  end
  
  #def save
    #@@all << self
  #end
  
  #def self.destroy_all
    #@@all.clear
  #end
end