require_relative '../../spec_helper'

describe "Werd::Solver::Overlap" do
  let(:solver) { Werd::Solver.solver_for(:overlap) }

  describe "determining the amount of overlap between two words" do
    it "determines that 'monkey' and 'horse' have no overlap" do
      overlap_amount = solver.num_overlapping_chars('monkey', 'horse')
      expect(overlap_amount).to eq(0)
    end

    it "determines that there is 1 overlapping letter in 'tomato' and 'orange'" do
      overlap_amount = solver.num_overlapping_chars('tomato', 'orange')
      expect(overlap_amount).to eq(1)
    end

    it "determines that there are 2 overlapping letters in 'tomato' and 'tomorrow'" do
      overlap_amount = solver.num_overlapping_chars('tomato', 'tomorrow')
      expect(overlap_amount).to eq(2)
    end

    it "determines that there are 3 overlapping letters in 'tomato' and 'atone'" do
      overlap_amount = solver.num_overlapping_chars('tomato', 'atone')
      expect(overlap_amount).to eq(3)
    end

    it "determines that there are 6 overlapping letters in 'tomato' and 'tomato'" do
      overlap_amount = solver.num_overlapping_chars('tomato', 'tomato')
      expect(overlap_amount).to eq(6)
    end
  end

  describe "generating words with a specified origin word and amount of overlap" do
    it "cannot generate a word given an overlap amount larger than the length of the origin word" do
      origin_word = 'tomato'

      generated_word = solver.overlapping_word(origin_word, (origin_word.length + 1))
      expect(generated_word).to be_nil
    end

    it "generates a word given an overlap amount equal to the length of the origin word" do
      origin_word = 'tomato'

      generated_word = solver.overlapping_word(origin_word, origin_word.length)
      expect(generated_word).not_to be_nil
      expect(generated_word.start_with?(origin_word)).to eq(true)
    end

    it "generates a word given an overlap amount of one" do
      origin_word = 'tomato'
      last_letter = Werd::Util.last_letter_of(origin_word)

      generated_word = solver.overlapping_word(origin_word, 1)
      expect(Werd::Util.first_letter_of(generated_word)).to eq(last_letter)
    end

    it "generates a word given an overlap amount of half the length of origin word" do
      origin_word = 'tomato'
      expected_overlap_amount = (origin_word.length / 2).ceil

      generated_word = solver.overlapping_word(origin_word, expected_overlap_amount)
      actual_overlap_amount = solver.num_overlapping_chars(origin_word, generated_word)
      expect(expected_overlap_amount).to eq(actual_overlap_amount)
    end
  end
end
