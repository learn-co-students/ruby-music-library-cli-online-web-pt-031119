require_relative './findable.rb'
# require_relative './nameable.rb'
# require_relative './persistable.rb'

class Genre
  extend Findable::ClassMethods
  extend Concerns::Findable
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
  
  attr_accessor :name
  attr_reader :songs
  
    @@all = []
    
    def initialize (name)
      @name = name 
      @songs = []
    end 
    
    def self.all
      @@all
    end 
    
    def save 
      @@all << self 
    end 
    
    def self.destroy_all
    @@all.clear
    end
    
    def self.count
      @@all.size 
    end
    
    def self.create(name)
      genre = new(name)
      genre.save
      genre
    end 
    
    def self.find_by_name(name)
      @@all.detect {|genre| genre.name == name}
    end
    
    def artists
      songs.collect{|s| s.artist}.uniq 
    end 
  end 
