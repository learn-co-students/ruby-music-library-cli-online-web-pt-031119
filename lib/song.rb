class Song
  
  @@all = []
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = Song.new(name)
    song.save
    song
    
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

def genre=(genre_object)
   @genre = genre_object
   #binding.pry
   #genre_object.songs.include?(self) ? return : genre_object.songs << self
  genre_object.songs << self unless genre_object.songs.include?(self) 
end

def self.find_by_name(sname)
  Song.all.detect do |song_name|
    song_name.name == sname
    end 
end

def self.find_or_create_by_name(song)
  #binding.pry
  if find_by_name(song)
    find_by_name(song)
  else
    create(song)
  end
  
 end

def self.new_from_filename(filename)
  r = filename.split(" - ")
  artist_name = r[0]
  song_name = r[1]
  genre = r[2].gsub(".mp3", "")
  artist = Artist.find_or_create_by_name(artist_name)
  #binding.pry
  genre = Genre.find_or_create_by_name(genre)
  #binding.pry
  Song.new(song_name, artist, genre)
  #binding.pry
  end
 
 def self.create_from_filename(filename)
        new_from_filename(filename).tap do  |s| 
          s.save 
   end
 end
   
  
  
  
  
  

  
end