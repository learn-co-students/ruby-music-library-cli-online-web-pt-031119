class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicLibraryController.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your library!"
      puts "To list sll of your songs, enter 'list songs'."
      puts "To list all of the artist in your library, enter 'list artists'."
      puts "To list all of the genre in your library, enter 'list genre'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs by a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
    end
  end

  def list_songs
    song.all.sort{|a, b| a.name <=> b.name}.each_with_index{|song, index| puts "#{index + 1}. #{song.artist} - #{song.name} - #{song.genre.anme}"}
  end

  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index{|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genre
    Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index{|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
  end
    # artist.songs.sort{|a, b|}

end
