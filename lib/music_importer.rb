class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|e| e.end_with?('.mp3')}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
