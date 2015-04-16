# Configure code coverage
require 'simplecov'
SimpleCov.start do
  SimpleCov.minimum_coverage 10 # lofty expectations

  add_filter '/spec'

  refuse_coverage_drop
end

# Load modules to test
# TODO this smells funny..
Dir['lib/**/*.rb'].each { |file| require_relative "../#{file}" }
