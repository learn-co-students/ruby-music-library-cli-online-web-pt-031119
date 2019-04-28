require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

require_relative '../findable.rb'
require_relative '../nameable.rb'
require_relative '../persistable.rb'