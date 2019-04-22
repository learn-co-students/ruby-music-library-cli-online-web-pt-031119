class Genre
  extend Concerns::Findable
<<<<<<< HEAD

  attr_accessor :name, :songs

=======
  
  attr_accessor :name
  attr_reader :songs
>>>>>>> 98c73fd34e15b7ad64ab0e67f259a4aa3bc54a93
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

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
<<<<<<< HEAD
    @songs.collect {|song| song.artist}.uniq
=======
    songs.collect {|song| song.artist}.uniq
>>>>>>> 98c73fd34e15b7ad64ab0e67f259a4aa3bc54a93
  end

end
