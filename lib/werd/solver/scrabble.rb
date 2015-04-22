require 'werd/util'

module Werd
  module Solver
    class Scrabble
      attr_reader :dictionary

      def initialize(dictionary)
        @dictionary = dictionary
      end

      def words_from_letters(letters)
        words = Werd::Util.words_from_letters(letters, @dictionary, min_letter_count=2)
      end

      def score_word(word)
        score = 0
        Werd::Util.letters_for(word).each do |letter|
          score += letter_value(letter)
        end

        score
      end

      def letter_value(letter)
        {
          'a' => 1, 'b' => 3, 'c' => 3, 'd' => 2, 'e' => 1, 'f' => 4, 'g' => 2,
          'h' => 4, 'i' => 1, 'j' => 8, 'k' => 5, 'l' => 1, 'm' => 3, 'n' => 1,
          'o' => 1, 'p' => 3, 'q' => 10,'r' => 1, 's' => 1, 't' => 1, 'u' => 1,
          'v' => 4, 'w' => 4, 'x' => 8, 'y' => 4, 'z' => 10,
        }[letter]
      end
    end
  end
end
