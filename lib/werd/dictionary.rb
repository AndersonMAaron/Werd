module Werd
  class Dictionary
    # Words are stored in hash solely because of lookup times
    def initialize(words_hash)
      @dictionary = words_hash
    end

    def self.from_file(file, min_letter_count)
      words_hash = {}
      File.open(file).each do |line|
        word = line.chomp("\n")
        words_hash[word] = "e" unless word.length < min_letter_count
      end

      Werd::Dictionary.new(words_hash)
    end

    def words
      @dictionary.keys
    end

    def contains?(letters, minimum_letters=0)
      return false if letters.length < minimum_letters
      @dictionary.has_key? letters
    end

    def random_word
      words.sample
    end

    def word_that_starts_with(letters)
      words.select { |word| word.start_with?(letters) == true }.sample
    end
  end
end
