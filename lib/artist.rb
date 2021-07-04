require_relative "./concerns/findable.rb"
require 'pry'
class Artist
  attr_accessor :song, :genre
  attr_reader :name
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
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
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    #binding.pry
    if @songs.include?(song) != true
      @songs << song
    else
      nil
    end
  end

  def genres
    self.songs.collect do |x|
      x.genre
    end.uniq
  end
end
