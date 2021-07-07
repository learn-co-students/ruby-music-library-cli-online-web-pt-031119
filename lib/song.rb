class Song

  attr_accessor :name, :file_name

  @@all = []

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? nil : genre.songs << self
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if genre != nil
      self.genre=(genre)
    end
    if artist != nil
      self.artist=(artist)
    end
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

  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find{|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ? find_by_name(song_name) : create(song_name)
  end

  def self.new_from_filename(file_name)
    file_name_split = file_name.split(/(.mp3)\z/) #removes the mp3 from the string
    file_name_array = file_name_split[0].split(" - ") #separates the .mp3 from the artist name, song name, and genre as three separate strings in an array
    artist_name = file_name_array[0].strip  #removes leading & trailing white spaces from artist name
    song_name = file_name_array[1].strip  #removes leading & trailing white spaces from song name
    genre_name = file_name_array[2].strip  #removes leading & trailing white spaces from genre name
    new_song = create(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist.add_song(new_song)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song.genre.add_song(new_song)
    new_song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end

end
