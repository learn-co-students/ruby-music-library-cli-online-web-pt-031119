module Concerns
  module Findable

    def find_by_name(obj_name)
      all.find {|obj| obj.name == obj_name}
    end

    def find_or_create_by_name(obj_name)
      if find_by_name(obj_name)
        find_by_name(obj_name)
      else
        create(obj_name)
      end
    end

  end
end
