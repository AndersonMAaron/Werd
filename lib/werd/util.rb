module Werd
  module Util
    ###
    ## Parsing letters of an individual word
    #########################################
    def self.letters_for(word)
      word.split(//)
    end

    #TODO first and last could probably be combined..
    def self.first_n_of(word, n)
      return nil if n > word.length
      letters_for(word).first(n).join
    end

    def self.last_n_of(word, n)
      return nil if n > word.length
      letters_for(word).last(n).join
    end

    def self.last_letter_of(word)
      last_n_of(word, 1)
    end

    def self.first_letter_of(word)
      first_n_of(word, 1)
    end

    def self.words_from_letters(letters_string, dictionary, minimum_letters)
      words = []
      for i in minimum_letters..letters_string.length do
        words << permute_words(letters_string, dictionary, i)
      end

      words.flatten
    end

    def self.permute_words(letters_string, dictionary, permute_i)
      words = []
      letters_for(letters_string).permutation(permute_i).each do |permutation|
        permute_string = permutation.join('')
        words << permute_string if dictionary.contains?(permute_string)
      end
      words
    end
  end
end
