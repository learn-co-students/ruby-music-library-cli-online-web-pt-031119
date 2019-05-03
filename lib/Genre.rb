class Genre
    extend Concerns::Findable
    @@all=[]
    attr_accessor :name, :songs

    def initialize(name)
        @name = name
        @songs = [] 
      end
      
      def self.all
          @all
      end
  
      def self.destroy_all
          all.clear
      end
  
      def save
          self.class.all<< self
      end 
  
      def self.create(name)
          genre =new(name)
          genre.save
          genre
      end

      def artist 
        songs.collect(&:artist.uniq
     end


    end
