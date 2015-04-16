module Werd
  module Solver
    def self.solver_for(app, language=:english)
      dictionary = Werd.dictionary_in(language)
      Werd::Solver.const_get(app.to_s.downcase.capitalize).new(dictionary)
    end
  end
end
