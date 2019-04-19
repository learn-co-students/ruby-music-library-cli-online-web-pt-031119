require 'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    x = MusicImporter.new(path)
    x.import
  end
  
  def call 
    input = ""
    while input != "exit"
    
    puts "Welcome to your music library!" 
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'." 
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
     input = gets.strip
      
      case input 
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres

      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
    end 
    end 
  end 

  def path
    @path
  end

  def list_songs 
   Song.all.sort {|a,b| a.name <=> b.name}.each_with_index{|song,index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end 
  
  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.each_with_index{|artist,index| puts "#{index + 1}. #{artist.name}"}
  end 
  
   def list_genres
    sorted_library = self.library.sort_by {|song|song.genre.name}
    genres = sorted_library.collect {|song|"#{song.genre.name}"}.uniq
    genres.each {|genre| puts "#{genres.index(genre) + 1}. #{genre}"}
  end
  
     def library(klass = Song)
    sorted_library = klass.all.collect{|object|object if object.class == klass }
    sorted_library = sorted_library.delete_if {|object|object==nil}
    sorted_library.uniq
  end
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
    artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index{|song,index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
  end 
    
   def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
    genre.songs.sort {|a,b| a.name <=> b.name}.each_with_index{|song,index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    
    if(1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end 
      puts "Playing #{song.name} by #{song.artist.name}" if song 
  end









end 
end 
end 