module Werd
  class Dictionary

    MIN_LETTER_CNT = 3 # Minimum number of letters to qualify as a word

    def initialize(dict_fn)
      @dictionary = read_dictionary(dict_fn)
    end

    def self.from_file(file)
      dictionary = {}
      File.open(filename).each do |line|
        word = line.chomp("\n")
        dictionary[word] = "e" unless word.length < MIN_LETTER_CNT
      end

      dictionary
    end

    def self.is_word?(letters, minimum_letters=0)
      return false if letters.length < minimum_letters
      @dictionary.has_key? letters
    end
  end
end
