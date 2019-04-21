module Concerns::Findable

  def find_by_name(name)
    self.all.find {|s| s.name == name}
  end

  def find_or_create_by_name(name)
    found = self.find_by_name(name)
    found ? found : self.create(name)
  end
end
