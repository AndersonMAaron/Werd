module Werd
  module Solver
    class Overlap
      def initialize(dictionary)
        @dictionary = dictionary
      end

      def overlapping_word(for_word, overlap_amount)
        last_n = previous_word.split(//).last(overlap_amount).join

        @dictionary.word_that_starts_with(last_n)
      end

      def num_overlapping_chars(word_one, word_two)
        word_two.length.times { |i| return (i+1) if word_two.split(//).first(i+1).join == word_one.split(//).last(i+1).join }
        word_two.length
      end
    end
  end
end
