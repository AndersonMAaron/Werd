#!/usr/bin/ruby

DICTIONARY = "dictionary/dictionary.txt"
MIN_LETTER_CNT = 3
MIN_CHAIN = 3
NUM_CHAINS = 20

def read_dictionary(filename)
  dictionary = {}
  File.open(File.absolute_path(filename)).each { |line| dictionary[line.chomp("\n")] = "e" }
  dictionary
end

def is_word?(letters)
  return false if letters.length < MIN_LETTER_CNT # Must be ^ length to qualify
  @dictionary.has_key? letters
end

def next_word(previous_word)
  req_overlap = 3
  last_n = previous_word.split(//).last(req_overlap).join

  # possible_words = @dictionary.select { |word| word.start_with?(last_n) == true }
  # possible_words.keys.sample
  @dictionary.select { |word| word.start_with?(last_n) == true }.keys.sample
end

def chars_overlapping(word_one, word_two)
  word_two.length.times { |i| return (i+1) if word_two.split(//).first(i+1).join == word_one.split(//).last(i+1).join }
  word_two.length
end

# abort("Error: Dictionary file '#{DICTIONARY}' not found.") unless File.exists?(DICTIONARY)
@dictionary = read_dictionary DICTIONARY

print "Please enter a word to start the chain: "
old_word = gets.chomp

chained_word = old_word
NUM_CHAINS.times do
  new_word = next_word(old_word)
  break if new_word.nil?
  puts new_word

  num_overlap = chars_overlapping(old_word, new_word)
  chained_word += new_word[num_overlap...new_word.length]

  old_word = new_word
end
puts '----------------------'
puts chained_word
