require_relative '../spec_helper'

describe "Werd" do
  let(:english_dictionary) { Werd.dictionary_in(:english) }

  describe "verifying words" do
    it "knows 'monkey' is a word" do
      is_word = english_dictionary.contains?('monkey')
      expect(is_word).to be_truthy
    end

    it "knows 'rammalammadingdong' is not a word" do
      is_word = english_dictionary.contains?('rammalammadingdong')
      expect(is_word).to be_falsey
    end
  end

  describe "choosing words" do
    it "can provide at least one word that starts with 'wor'" do
      word = english_dictionary.word_that_starts_with('wor')
      expect(word.include?('wor')).to be_truthy
    end

    it "cannot provide one word that starts with 'rammalammadingdon'" do
      word = english_dictionary.word_that_starts_with('rammalammadingdon')
      expect(word).to be_nil
    end
  end
end
