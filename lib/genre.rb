class Genre
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
    #@@all << self
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
      @songs << song
    end
  end

end
