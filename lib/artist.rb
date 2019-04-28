require_relative './findable.rb'
require_relative './nameable.rb'
require_relative './persistable.rb'

class Artist
  extend Findable::ClassMethods
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name 
    @@all = []
    
    # def initialize (name)
    #   @name = name 
    #   save
    # end 
    
    # def self.all
    #   @@all
    # end 
    
    # def save 
    #   @@all << self 
    # end 
    
    # def self.destroy_all
    # @@all.clear
    # end  
    
    # def self.count
    #   @@all.size 
    # end
    
    # def self.find_by_name(name)
    #   @@all.detect { |artist| artist.name == name}
    # end 
end 