require_relative '../spec_helper'

describe "Werd::Solver" do
  describe "providing solvers" do
    it "can provide an overlap solver" do
      solver = Werd::Solver.solver_for(:overlap)
      expect(solver).to be_a(Werd::Solver::Overlap)
    end

    it "can provide a scrabble solver" do
      solver = Werd::Solver.solver_for(:scrabble)
      expect(solver).to be_a(Werd::Solver::Scrabble)
    end
  end
end
