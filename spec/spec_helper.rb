# Configure code coverage
# require 'simplecov'
# SimpleCov.start do
#   SimpleCov.minimum_coverage 10 # lofty expectations

#   add_filter '/spec'
# end

# Load modules to test
# TODO this smells funny..
Dir['lib/**/*.rb'].each { |file| require_relative "../#{file}" }
