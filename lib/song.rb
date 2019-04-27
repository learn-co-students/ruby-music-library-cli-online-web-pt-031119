require "pry"
class Song 
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil 
      self.artist = artist
    end
    if genre != nil 
      self.genre = genre
    end
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
  
  def self.create(song) 
    created_song = Song.new(song)
    created_song.save
    created_song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(file_name)
    song_name= file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    genre_name = file_name.split(" - ")[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name,artist,genre)
  #binding.pry
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
  
    
 
end 