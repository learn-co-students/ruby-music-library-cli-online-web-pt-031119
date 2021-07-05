require 'bundler'
require_relative '../lib/concerns/findable.rb'
require_relative '../lib/concerns/persistable.rb'
require_relative '../lib/concerns/nameable.rb'
Bundler.require

require_all 'lib'
