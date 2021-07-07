class Genre

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
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song
  end

  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end

  def artists
    artists_arry = []
    self.songs.collect{|x| artists_arry << x.artist}
    artists_arry.uniq
  end

end
