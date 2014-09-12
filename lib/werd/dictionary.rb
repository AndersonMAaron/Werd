module Werd
  class Dictionary

    MIN_LETTER_CNT = 3 # Minimum number of letters to qualify as a word

    def initialize(dict_fn)
      @dictionary = read_dictionary(dict_fn)
    end

    def read_dictionary(filename)
      dictionary = {}
      File.open(File.absolute_path(filename)).each do |line|
        word = line.chomp("\n")
        dictionary[word] = "e" unless word.length < MIN_LETTER_CNT
      end

      dictionary
    end

    def is_word?(letters)
      return false if letters.length < MIN_LETTER_CNT # Must be ^ length to qualify
      @dictionary.has_key? letters
    end
  end
end
