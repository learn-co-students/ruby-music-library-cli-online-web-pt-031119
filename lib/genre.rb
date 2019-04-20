require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
    song
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
end
