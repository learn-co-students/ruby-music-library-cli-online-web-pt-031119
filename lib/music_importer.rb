require 'pry'

class MusicImporter

  attr_reader :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir.entries(path).select {|filename| filename.end_with?('.mp3')}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end
