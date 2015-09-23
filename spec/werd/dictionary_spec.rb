require_relative '../spec_helper'

describe "Werd::Dictionary" do
  let(:english_dictionary) { Werd.dictionary_in(:english) }

  describe "verifying words" do
    it "knows 'monkey' is a word" do
      is_word = english_dictionary.contains?('monkey')
      expect(is_word).to eq(true)
    end

    it "knows 'rammalammadingdong' is not a word" do
      is_word = english_dictionary.contains?('rammalammadingdong')
      expect(is_word).to eq(false)
    end
  end

  describe "choosing words" do
    it "can provide at least one word that starts with 'wor'" do
      word = english_dictionary.word_that_starts_with('wor')
      expect(word.include?('wor')).to eq(true)
    end

    it "cannot provide one word that starts with 'rammalammadingdon'" do
      word = english_dictionary.word_that_starts_with('rammalammadingdon')
      expect(word).to be_nil
    end

    # since we are testing a random word, there is a finite chance it
    # returns the same word over and over, but that chance is negligible
    # if we increase the sample size to 10.
    it "can provide a random word" do
      words = []
      10.times { |times| words << english_dictionary.random_word }
      expect(words.uniq.length).not_to eq(1)
    end
  end
end
