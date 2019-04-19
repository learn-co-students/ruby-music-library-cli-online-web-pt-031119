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
    self.artist = artist_obj if artist_obj
    self.genre = genre_obj if genre_obj
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    new_song = new(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre.sub('.mp3', ''))
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
