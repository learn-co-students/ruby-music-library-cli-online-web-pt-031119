require 'pry'

class Song 
  
  extend Concerns::Findable
  
  attr_accessor :name, :song 
  attr_reader :artist, :genre
  
  @@all = []
  
    def initialize(name, artist= nil, genre= nil)
      @name = name 
      self.artist = artist if artist 
      self.genre = genre if genre
    end 

    def self.create(name)
    song = Song.new(name)
    self.all << song 
    song 
    end

    def save
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
  
    def self.destroy_all
     @@all.clear
    end 
    
    def artist=(artist)
      @artist = artist 
      artist.add_song(self)
    end 
 
    def genre=(genre)
      @genre = genre 
      if !genre.songs.include?(self)
        genre.songs << self 
      end 
    end 
    
    def self.find_by_name(name)
      @@all.detect {|a| a.name == name }
    end 
    
    def self.find_or_create_by_name(name)
      if find_by_name(name)
         find_by_name(name)
      else 
        self.create(name)
      end
  end 
  
   def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end 
  
  def self.create_from_filename(name)
    new_from_filename(name)
  end 
    
    
end 