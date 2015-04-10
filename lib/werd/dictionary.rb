module Werd
  class Dictionary

    def initialize(words)
      @dictionary = words
    end

    def words
      @dictionary
    end

    def self.from_file(file, min_letter_count)
      dictionary = {}
      File.open(file).each do |line|
        word = line.chomp("\n")
        dictionary[word] = "e" unless word.length < min_letter_count
      end

      Werd::Dictionary.new(dictionary)
    end

    def is_word?(letters, minimum_letters=0)
      return false if letters.length < minimum_letters
      @dictionary.has_key? letters
    end
  end
end
