class Artist
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
      @songs << song
    end
  end

  def genres
    song = Song.all.select {|s| s.artist == self}
    song.map {|s| s.genre}.uniq
    #self.songs.map {|b| b.genre}.uniq
    #binding.pry
  end

end
