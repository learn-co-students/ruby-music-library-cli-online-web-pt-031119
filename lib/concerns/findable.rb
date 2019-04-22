#require_relative "../config/environment.rb"

module Concerns
    module Findable

        #module ClassMethods

            def self.find_by_name(name)
                found = self.all.detect {|song| song.name == name}
                return found.class 
            end

            def self.find_or_create_by_name(name)
                self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
            end
        #end 
    end     
  end 