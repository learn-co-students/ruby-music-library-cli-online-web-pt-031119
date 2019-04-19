
class Genre
  attr_accessor :name 
  attr_reader :songs
  
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  
  @@all = []
  
  def initialize (name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
end