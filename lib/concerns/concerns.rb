module Concerns

  module Findable


    def find_by_name(str_name)  #str_name is the artist or genre name in the form of a string
        self.all.find{|x| x.name == str_name}
    end

    def find_or_create_by_name(str_name)  #str_name is the artist or genre name in the form of a string
      find_by_name(str_name) ? find_by_name(str_name) : create(str_name)
    end

  end

end
