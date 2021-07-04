require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self) == true
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
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(song)
    @@all.find{|x| x.name == song}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil
      self.create(song)
    else
      self.find_by_name(song)
    end
  end

  def self.new_from_filename(name)
    new_name = name.gsub(".mp3","")
    artist, song, genre = new_name.split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end
end
