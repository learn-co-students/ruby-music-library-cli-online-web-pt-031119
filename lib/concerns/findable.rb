require 'pry'
module Concerns::Findable 
  
  def find_by_name(name)  
    self.all.detect{|obj| obj.name == name}
  end     #def 

  def find_or_create_by_name(name)
    if self.find_by_name(name).nil?
        self.create(name)
      else
        self.find_by_name(name)
      end
  end     #def 





end #module








# module Concerns
#   module Findable
#     def self.find_by_name(name)
       
#     #@@all.find {|song| song.name == name} 
#     end     #def 
  
#   end #findable 
# end #concerns 

#extend = class methods 
#include = instance methods 
