require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def initialize(name, artist_obj = nil, genre_obj = nil)
    @name = name
    self.artist = artist_obj if artist_obj != nil
    self.genre = genre_obj if genre_obj != nil
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create(song_name)
    end
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    song = self.new(arr[1])
    song.artist = Artist.find_or_create_by_name(arr.first)
    song.genre = Genre.find_or_create_by_name(arr[2].sub('.mp3', ''))
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
end
