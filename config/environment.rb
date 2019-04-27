require 'bundler'
Bundler.require

module Concerns
  module Findable
 
 def find_by_name(sname)
    all.detect do |song_name|
    song_name.name == sname
      end 
    end
def find_or_create_by_name(song)
  
  if find_by_name(song)
    find_by_name(song)
  else
    create(song)
  end
  
 end

    
  
  end
end


require_all 'lib'
