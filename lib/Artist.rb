require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

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

  def self.create(artist)
    newArtist = Artist.new(artist)
    newArtist.save
    newArtist

  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)

  end

  def genres
		songs.collect do |song|
      song.genre
		end.uniq
	end
  
end

