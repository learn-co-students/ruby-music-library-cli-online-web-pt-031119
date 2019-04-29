require_relative './findable.rb'
# require_relative './nameable.rb'
# require_relative './persistable.rb'

class MusicImporter
  attr_reader :path 
  
  def initialize (path)
    @path = path
  end 
  
  def files 
    @files ||= Dir.glob("#{path}/*.mp3").collect {|i| i.gsub("#{path}/", "")}
  end 
  
  def import 
    files.each{|i| Song.create_from_filename(i)}
  end
end 