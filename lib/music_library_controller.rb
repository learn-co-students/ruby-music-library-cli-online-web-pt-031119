require 'pry'

class MusicLibraryController

  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
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

    response = nil
    until response == 'exit' do
      puts "What would you like to do?"
      response = gets.chomp

      case response
        when "list songs"
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when "list artist"
          self.list_songs_by_artist
        when "list genre"
          self.list_songs_by_genre
        when "play song"
          self.play_song
      end
    end

  end

  def list_songs
    num = 0
    Song.all.sort_by {|song| song.name}.each do |song|
      num += 1
      puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    num = 0
    Artist.all.sort_by {|artist| artist.name}.each do |artist|
      num += 1
      puts "#{num}. #{artist.name}"
    end
  end

  def list_genres
    num = 0
    Genre.all.sort_by {|genre| genre.name}.each do |genre|
      num += 1
      puts "#{num}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    num = 0
    if Artist.find_by_name(artist_name)
      Artist.find_by_name(artist_name).songs.sort_by {|song|
        song.name
      }.each do |song|
          num += 1
          puts "#{num}. #{song.name} - #{song.genre.name}"
        end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    num = 0
    if Genre.find_by_name(genre_name)
      Genre.find_by_name(genre_name).songs.sort_by {|song|
        song.name
      }.each do |song|
        num += 1
        puts "#{num}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_request = gets.chomp.to_i - 1
    song_list = Song.all.sort_by {|song| song.name}
    if song_request >= 0 && song_request <= song_list.length && song_list[song_request]
      puts "Playing #{song_list[song_request].name} by #{song_list[song_request].artist.name}"
    else
      nil
    end

  end

end
