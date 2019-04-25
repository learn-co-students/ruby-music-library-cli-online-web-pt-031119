require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    mi = MusicImporter.new(path)
    mi.import
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

    4.times do
      input = gets.chomp! unless input == "exit"
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
     class_sort(Artist).each.with_index(1) do |singer, i|
      puts "#{i}. #{singer.name}"
      end
    end

    def list_genres
      class_sort(Genre).each.with_index(1) do |genre, i|
        puts "#{i}. #{genre.name}"
      end
    end

    def get_artist(input)
      Artist.find {|singer| singer.name == input}
      #take in users input & find said artist in Artist class
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.chomp
      get_artist(input) #list said artist's songs alphabetically by song name

      #prints all songs by said artist in a numbered list (alphabetized by song name) < using #list_songs

        #Please enter the name of an artist:")
        #puts "#{i}. #{song.name} - #{song.genre}"
        #1. Green Aisles - country")
        #2. It's Real - hip-hop")
        #3. Wonder Years - dream pop")

   end

end
