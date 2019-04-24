require 'pry'

class MusicImporter

    attr_accessor :path 

    def initialize(path)
        @path = path
    end

    def path 
        @path 
    end 

    def files
        Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
    
    def import 
        files.each {|mp3| Song.create_from_filename("#{mp3}")} 
    end 

end 