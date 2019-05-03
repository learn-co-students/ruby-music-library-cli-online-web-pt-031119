class MusicLibraryCotnroller
    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end
    def call 
       input = ''
        while input != 'exit'

        puts "welcome to your music Library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library,  enter 'list artists'."
        puts "To list all of the genres in your library,  enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs by a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, tyoe 'exit'."
        puts "What would you like to do?"

        input = gets.strip
        end
    end

    def list_songs 
        Songs.all.sort_by(&:name).each.with_index(1) do |song, idx|
        puts   "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

    end
end

def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |art, idx|
    puts "#{idx}. #{art.name}"

end
end


def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |gn, idx|
    puts "#{idx}. #{gn.name}"

end
end


def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if  artist = Artist.find_by_name(input)
      artist.song.sort_by(&:name).each.with_index(1) do | song, idx|
        puts "#{idx}. #{song.name} - #{song.genre.name}"
    end
 end
end


def list_songs_by_genre
    puts "Please enter the name of an genre:"
    input = gets.strip
    
    if  genre = Genre.find_by_name(input)
      genre.song.sort_by(&:name).each.with_index(1) do | song, idx|
        puts "#{idx}. #{song.artist.name} - #{song.name}"
    end
 end
end

def  play_song
    puts "Which song number Would you like to play?"
    inputs = get.strip.to_i
    if (1..Song.all.length).include?(input)
    song =song.all.sort_by(&:name)[input - 1]
    end
    puts "playing #{song.name} by #{song..name}" if song
  end
end

    
    
end