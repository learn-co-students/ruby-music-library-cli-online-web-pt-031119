class Genre
  extend Concerns::Findable
  attr_accessor :name, :genre
  @@all = []

  def initialize(name)
    @name = name
    @genre = genre
    @songs = []
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

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    songs.map { |song| song.artist }.uniq
  end
end
