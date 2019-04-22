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

  def class_sort(klass)
    klass.all.sort_by{|obj| obj.name}
  end

  def list_songs
    class_sort(Song).each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    class_sort(Artist).each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    class_sort(Genre).each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def sort_list(klass, obj_name)
    klass.find_by_name(obj_name).songs.sort_by {|song| song.name}
  end

  def get_list(klass)
    obj_name = gets.chomp
    self.sort_list(klass, obj_name) if klass.find_by_name(obj_name)
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    if self.get_list(Artist)
      self.get_list(Artist).each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    if self.get_list(Genre)
      self.get_list(Genre).each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    i = gets.chomp.to_i - 1
    song_list = class_sort(Song)

    if (0..song_list.length-1).include?(i)
      puts "Playing #{song_list[i].name} by #{song_list[i].artist.name}"
    else
      nil
    end

  end

end
