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
    self.genre= genre if genre
  end
  
  def self.all 
    @@all 
  end
  
  def artist= name
    @artist = name
    name.add_song(self)
  end
  
  def genre= (genre)
     @genre = genre
     genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name (name)
    all.detect do |songs|
      songs.name == name
    end
  end
  
  def self.find_or_create_by_name (name)
    if find_by_name(name) != nil
      find_by_name(name) 
    else 
      Song.create(name)
    end
  end
  
  def self.new_from_filename (list)
   song = find_or_create_by_name(list.split(" - ")[1])
   song.artist = Artist.find_or_create_by_name(list.split(" - ")[0])
   song.genre = Genre.find_or_create_by_name(list.split(" - ")[2].delete".mp3")
   song
  end
  
  def self.create_from_filename (file)
    new_song = new_from_filename(file)
    new_song.save
    new_song
  end

end