require 'pry'

class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    @path = path
    #binding.pry
    MusicImporter.new(path).import
    #binding.pry
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    a = nil
    while a != "exit"
     a = gets.chomp
     end
    
  end
  
  def list_songs
 a = Song.all.sort{ |a,b| a.name <=> b.name}
    a.each_with_index do |value,index|
      puts "#{1 + index}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
    end
   end
 
   def list_artists
     #binding.pry
     
    a = Artist.all.sort{ |a,b| a.name <=> b.name }
    a.each_with_index do |value,index|
      #binding.pry
      puts "#{1 + index}. #{value.name}"
    end
   end
   
   def list_genres
    
    a = Genre.all.sort{ |a,b| a.name <=> b.name}
    a.each_with_index do |value,index|
       #binding.pry
      puts "#{1 + index}. #{value.name}"
    end
   end
 
# def list_songs_by_artist
#   puts "Please enter the name of an artist:"
#   a = gets.chomp
#     #binding.pry
#     blank = []
#   songs_array = Artist.all.collect do |artist|
#     if artist == a 
#       blank << artist.songs
 
     
#   end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    data = gets.chomp
#binding.pry
    if artist = Artist.find_by_name(data)
     # binding.pry
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end 
  
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    data = gets.chomp
    if genre = Genre.find_by_name(data)
     
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
        
        puts "#{i}. #{a.artist.name} - #{a.name}"
      end
    end
  end 
 
 def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
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


 
  
end