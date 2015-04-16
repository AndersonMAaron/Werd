require_relative '../spec_helper'

describe "Werd::Solver" do
  describe "providing solvers" do
    it "can provide an overlap solver" do
      solver = Werd::Solver.solver_for(:overlap)
      expect(solver).to be_a(Werd::Solver::Overlap)
    end
  end
end
