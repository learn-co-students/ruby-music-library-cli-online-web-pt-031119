class Song 
  attr_accessor :name 
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
   
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    all.clear
  end     #def 
  
  def save 
    @@all << self 
    #self.class.all << self
  end     #def 
  
  def self.create(name)
    song = new(name)
    song.save
    song
  end     #def 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end     #def 
  
  def genre=(genre)
    @genre = genre 
    #genre.songs << self 
    genre.songs << self unless genre.songs.include?(self)
  end     #def 
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name} 
  end     #def 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil 
      self.find_by_name(name)
    else self.create(name)
    end 
    #return an existing song if it exists in @@all 
  end     #def 
  
 def self.new_from_filename(name)  #??????? 
    artist, song, genre_name = name.split(' - ')
    fixed_name = genre_name.gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_name)
    new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)  #??????? 
    new_from_filename(filename).tap{ |s| s.save }
  end
  
end #class 