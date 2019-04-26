require_relative "./concerns/findable.rb"
require 'pry'

class Song 

    extend Concerns::Findable  

    attr_accessor :song, :artist, :genre 
    attr_reader :name

    @@all = []

     
    def initialize(name, artist=nil, genre=nil)  
        @name = name
        self.artist= (artist) if artist
        self.genre= (genre) if genre     
    end
    
    def name= (name)
        @name = name 
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

    def self.create(name)
        song = self.new(name)  
        song.save 
        song  
    end 

    def artist= (artist)
        @artist = artist
        artist.add_song(self)  
    end 
    
    def genre= (genre)
        @genre = genre 
        genre.add_song(self) 
    end 

    def self.new_from_filename(filename)
        new_song_file = filename.split(" - ")
        new_song = Song.new(new_song_file[1])
        new_song.artist = Artist.find_or_create_by_name(new_song_file[0])
        new_song.genre = Genre.find_or_create_by_name(new_song_file[2].gsub(".mp3", "")) 
        new_song 
        #binding.pry 
    end 

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save  
    end 

    # def self.find_by_name(name)
    #     self.all.detect {|song| song.name == name}
    # end
    
    # def self.find_or_create_by_name(name)
    #     self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    # end 
        

end 
     
