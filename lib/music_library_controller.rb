class MusicLibraryController

  attr_accessor :file_path

  def initialize(file_path='./db/mp3s')
    @file_path = file_path
    MusicImporter.new(file_path).import
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

    response = nil
    until response == "exit"
      response = gets.chomp
      response
    #  binding.pry
        if response == "list songs"
          list_songs
        elsif response == "list artists"
          list_artists
        elsif response == "list genres"
           list_genres
        elsif response == "list artist"
           list_songs_by_artist
        elsif response == "list genre"
           list_songs_by_genre
        elsif response == "play song"
           play_song
        end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name }

    sorted_songs.each_with_index do |x, index|
       puts "#{index+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}

    sorted_artists.each_with_index do |x, index|
      puts "#{index+1}. #{x.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}

    sorted_genres.each_with_index do |x, index|
      puts "#{index+1}. #{x.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets.chomp
    sorted_songs = Song.all.sort_by {|song| song.name}
    counter = 0
    sorted_songs.each do |x|
      if x.artist.name == response
        counter += 1
        puts "#{counter}. #{x.name} - #{x.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets.chomp
    sorted_songs = Song.all.sort_by {|song| song.name}
    counter = 0
    sorted_songs.each do |x|
      if x.genre.name == response
        counter += 1
        puts "#{counter}. #{x.artist.name} - #{x.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    response = gets
    response = response.to_i
      if response > 0 && response <= Song.all.size
        sorted_songs = Song.all.sort_by {|song| song.name }
        sorted_songs.each_with_index do |x, index|
          if response == index+1
           puts "Playing #{x.name} by #{x.artist.name}"
          end
        end
      end
  end

end
