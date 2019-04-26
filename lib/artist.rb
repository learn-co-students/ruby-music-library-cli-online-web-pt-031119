require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
      self.songs << song unless self.songs.include?(song)
    else
      self.songs << song unless self.songs.include?(song)
    end
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
