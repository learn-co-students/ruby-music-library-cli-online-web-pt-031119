class Genre 
  attr_accessor :name 
  attr_reader :songs 
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end     #def 
  
  def self.all 
    @@all 
  end     #def 
  
  def self.destroy_all
    all.clear
  end     #def 
  
  def save 
    @@all << self 
  end     #def 
  
  def self.create(name)
    genre = new(name)
    genre.save 
    genre 
  end     #def 
  
  def songs 
    @songs 
  end     #def 
  
  def artists 
    songs.collect do |song|
      song.artist 
    end.uniq
  end     #def 
  
end 