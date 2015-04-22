require 'werd/util'

module Werd
  module Solver
    class Overlap
      attr_reader :dictionary

      def initialize(dictionary)
        @dictionary = dictionary
      end

      def overlapping_word(for_word, overlap_amount)
        return nil if (last_letters = Werd::Util.last_n_of(for_word, overlap_amount)).nil?
        @dictionary.word_that_starts_with(last_letters)
      end

      def num_overlapping_chars(word_one, word_two)
        overlap = 0
        word_two.length.times do |i|
          english_i = (i + 1) # In english, we start counting at 1, not 0
          overlap = english_i if (Werd::Util.first_n_of(word_two, english_i) == Werd::Util.last_n_of(word_one, english_i))
        end
        overlap
      end
    end
  end
end
