require_relative "./concerns/findable.rb"
require 'pry'

class Artist

    extend Findable::ClassMethods  

    attr_accessor :artist, :song, :genre 
    attr_reader :name 

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        #@genres = []   
    end 

    def name= (name)
        @name = name 
    end 

    def self.all 
        @@all 
    end 

    def songs
        @songs
    end

    def genres
        self.songs.collect {|song| song.genre if song.genre}.uniq
    end 

    def save
        self.class.all << self # same as - @@all << self - just more abstracted 
    end 

    def self.destroy_all
        @@all.clear 
    end 

    def self.create(name)
        artist = self.new(name)
        artist.save 
        artist  
    end

    def add_song(song)
        if self.songs.length == 0 
            self.songs << song
            song.artist = self if !song.artist 
        else  
            self.songs.each do |s| 
                if s == song 
                    self.song    
                else  
                    self.songs << song
                    song.artist = self if !song.artist 
                end 
            end
        end       
    end 
    
     

end 
