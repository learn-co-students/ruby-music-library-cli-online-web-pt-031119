require 'pry'

class Genre 

    attr_accessor :genre, :song, :artist
    attr_reader :name 
    
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []

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

    def save 
        self.class.all << self  
    end 

    def self.destroy_all
        @@all.clear 
    end 

    def self.create(name)
        genre = self.new(name)
        genre.save 
        genre  
    end
    
    def add_song(song)
        if self.songs.length == 0
            self.songs << song
            song.genre = self if !song.genre 
        else 
            self.songs.each do |s|
                if s == song
                    self.song
                else 
                    self.songs << song
                    song.genre = self if !song.genre 
                end 
            end 
        end 
    end
    
    def artists
        self.songs.collect {|song| song.artist if song.artist}.uniq
    end 

end 
