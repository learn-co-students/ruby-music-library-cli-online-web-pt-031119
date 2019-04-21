 require "pry"
 
 class MusicLibraryController
  
  def initialize (path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
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
    answer = gets.chomp
    if answer == 'list songs'
      list_songs 
    elsif answer == 'list artists'
      list_artists
    elsif answer == 'list genres' 
      list_genres
    elsif answer == 'list artist'
      list_songs_by_artist
    elsif answer == 'list genre' 
      list_songs_by_genre
    elsif answer == 'play song'
      play_song
    else
    while answer != "exit"
     puts "What would you like to do?"
     answer = gets.chomp 
    end
  end
  end
  
  def list_songs
   list = Song.all.sort do |x,y|
     x.name <=> y.name
   end
   list.uniq.each_with_index do |track, index|
     puts "#{index + 1}. #{track.artist.name} - #{track.name} - #{track.genre.name}"
   end
  end
  
  def list_artists
  list = Artist.all.sort do |x,y|
     x.name <=> y.name
   end
  list.uniq.each_with_index do |singer, index|
     puts "#{index + 1}. #{singer.name}"
   end  
  end
  
  def list_genres
     list = Genre.all.sort do |x,y|
     x.name <=> y.name
   end
  list.uniq.each_with_index do |kind, index|
     puts "#{index + 1}. #{kind.name}"
   end  
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.chomp 
    if Artist.find_by_name(answer)
     singer = Artist.find_by_name(answer)
     tracks = singer.songs.sort do |x,y|
       x.name <=> y.name
     end 
     tracks.each_with_index do |song, index|
       puts "#{index + 1}. #{song.name} - #{song.genre.name}"
     end
   end
  end
  
  def list_songs_by_genre 
       puts "Please enter the name of a genre:"
    answer = gets.chomp 
    if Genre.find_by_name(answer)
     kind = Genre.find_by_name(answer)
     tracks = kind.songs.sort do |x,y|
       x.name <=> y.name
     end 
     tracks.each_with_index do |kind, index|
       puts "#{index + 1}. #{kind.artist.name} - #{kind.name}"
     end
   end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    list = Song.all.sort do |x,y|
     x.name <=> y.name
   end
    answer = gets.chomp
    list.uniq.each_with_index do |song, index|
    puts "Playing #{song.name} by #{song.artist.name}" if index + 1 == answer.to_i
    end
    end
end