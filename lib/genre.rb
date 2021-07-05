require_relative './concerns/findable.rb'

class Genre
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    self.class.all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

  def self.create_new(name)
    genre=self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end

end
