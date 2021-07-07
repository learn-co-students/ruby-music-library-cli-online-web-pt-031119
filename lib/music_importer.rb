class MusicImporter

  attr_accessor :path, :file_names

  def initialize(path) #path is a file path in the form of a string ex: "./spec/fixtures/mp3s"
    @path = path
    @file_names = []
  end

  def files
    self.file_names = Dir.glob("*.mp3", base: self.path).select {|f| !File.directory? f}
  end

  def import
    self.files.collect do |x|
      Song.create_from_filename(x)
    end
  end

end
