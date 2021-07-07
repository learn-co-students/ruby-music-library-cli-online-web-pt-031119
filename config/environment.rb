require 'pry'

require 'bundler'
Bundler.require

# module Concerns
# end

# require_all 'lib'

require_relative '../lib/concerns/concerns'
require_relative '../lib/artist.rb'
require_relative '../lib/genre.rb'
require_relative '../lib/song.rb'
require_relative '../lib/music_importer.rb'
require_relative '../lib/music_library_controller.rb'
