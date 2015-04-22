require_relative '../../spec_helper'

describe "Werd::Solver::Scrabble" do
  let(:solver) { Werd::Solver.solver_for(:scrabble) }

  # NOTE: For this set of tests, a 'word' is simply a collection of letters.
  # Determining wether or not a 'word' exists in a given dictionary
  # is an independent check
  describe "scoring words" do
    it "can score the word 'monkey'" do
      expected_score = 15 # m(3) + o(1) + n(1) + k(5) + e(1) + y(4)
      actual_score = solver.score_word('monkey')
      expect(actual_score).to eq(expected_score)
    end

    it "scores an empty string as zero points" do
      score = solver.score_word('')
      expect(score).to eq(0)
    end
  end

  describe "finding words from letters" do
    it "finds no words in an empty string" do
      words = solver.words_from_letters('')
      expect(words).to be_empty
    end

    it "finds words from 'abc'" do
      words = solver.words_from_letters('abc')
      expect(words).not_to be_empty
      expect(words).to include('cab')
    end

    it "finds a fuck ton of words from the whole alphabet" do
      alphabet = 'abcdefghijklmnopqrstuvwxyz'
      words = 'just kidding this would take forever'
    end
  end
end
