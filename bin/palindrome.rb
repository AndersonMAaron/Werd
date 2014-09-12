#!/usr/bin/ruby

DICTIONARY = "dictionary/dictionary.txt"

def read_dictionary(filename)
  dictionary = {}
  File.open(File.absolute_path(filename)).each { |line| dictionary[line.chomp("\n")] = "e" }
  dictionary
end

abort("Error: Dictionary file '#{DICTIONARY}' not found.") unless File.exists?(DICTIONARY)
dictionary = read_dictionary DICTIONARY

dictionary.keys.each { |word| puts "#{word}" if word == word.reverse }
