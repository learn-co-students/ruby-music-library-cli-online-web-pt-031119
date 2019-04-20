module Concerns
  
module ClassMethods
  
  def destroy_all 
    self.all.clear
  end
  
  def create (name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end
  
end

module InstanceMethods
  
  def save
    self.class.all << self
  end
  
end

module Findable
  def find_by_name (name)
    all.detect do |element|
      element.name == name
    end
  end
    
  def find_or_create_by_name (name)
    if find_by_name(name) != nil
      find_by_name(name) 
    else 
      create(name)
    end
  end  
  
end

end