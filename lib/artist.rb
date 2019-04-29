require_relative './findable.rb'
# require_relative './nameable.rb'
# require_relative './persistable.rb'

class Artist
  extend Findable::ClassMethods
  extend Concerns::Findable
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
  
  
  attr_accessor :name, :songs
  attr_reader :songs
    
    @@all = []
  
    def initialize (name)
      @name = name 
      @songs = []
    end 
    
    def self.create(name)
      artist = new(name)
      artist.save
      artist
    end
    
    def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include? (song)
    end 
    
    def genres 
      songs.collect{ |song| song.genre}.uniq 
    end 
    
    def self.all
      @@all
    end 
    
    def save 
      self.class.all << self 
    end 
    
    def self.destroy_all
    @@all.clear
    end  
    
    def self.count
      @@all.size 
    end
    
    def self.find_by_name(name)
      @@all.detect {|artist| artist.name == name}
    end 
    
end 