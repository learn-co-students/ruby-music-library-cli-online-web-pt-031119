require 'pry'

class MusicLibraryController

    attr_accessor :path 
    
    def initialize(path='./db/mp3s')  
        @path = path
        music_importer = MusicImporter.new(path) 
        music_importer.import  
    end

    def list_songs
        Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            #binding.pry
        end 
    end 
    
    def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
            #binding.pry
        end 
    end

    def list_genres
        Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre.name}"
            #binding.pry
        end 
    end

    def list_songs_by_artist

        puts "Please enter the name of an artist:"

        input = gets.chomp

        if artist = Artist.find_by_name(input)
            artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
                puts "#{index}. #{song.name} - #{song.genre.name}"
                #binding.pry 
            end  
        end 
    end 
        #binding.pry 


        #input = ""

        # while input != Artist.name 
        #     #binding.pry 
        #     puts "Please enter the name of an artist:"
        #     input = gets.chomp
        #     Artist.all.each.with_index do |artist, index|
        #         if artist.name == input
        #             puts "#{index}. #{artist.song.name} - #{artist.song.genre.name}"
        #         end 
        #     end 

            #binding.pry 
            # Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |artist, index|
            #     #binding.pry 
            #     puts "#{index}. #{artist.song.name} - #{artist.song.genre.name}"
            #     #binding.pry 
            # end
            
            # song_genre = []

        # Artist.all.each do |artist|
        #     if artist.name == input
        #         song_genre << artist.songs
        #         #binding.pry 
        #     end 
        # end
         
    #end 



    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        #puts "What would you like to do?"

        input = "" 

        while input != "exit"

            puts "What would you like to do?"

            input = gets.chomp 

            case input

            when "list songs"
                self.list_songs
            when "list artists"
                list artists 
            when "list genres"
                list genres 
            when "list artist"
                list artist
            when "list genre"
                list genre 
            when "play song"
                play song 
            end  
        end 
    end 
    
    

end




