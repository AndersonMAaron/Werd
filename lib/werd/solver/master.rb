module Word
  module Solver
    class Master
      attr_reader :dictionary,
                  :overlap_solver

      def initialize(dict_fn)
        @dictionary = Word.dictionary_in(:english)
        @overlap_solver = Word::Play::Overlap.new(@dictionary)
      end

      def self.solver_for(app)
        dictionary = Werd.dictionary_in(:english)
        Werd::Solver.const_get(app.downcase.capitalize).new(dictionary)
      end

    end
  end
end
