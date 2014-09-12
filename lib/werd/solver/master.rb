module Word
  module Solver
    class Master
      attr_reader :dictionary,
                  :overlap_solver

      def initialize(dict_fn)
        @dictionary = Word::Dictionary.new(dict_fn)
        @overlap_solver = Word::Play::Overlap.new(@dictionary)
      end
    end
  end
end
