require_relative 'spec_helper'

describe "Werd" do
  let(:english_dictionary) { Werd.dictionary_in(:english) }

  describe "checking words" do
    it "knows 'monkey' is a word" do
      is_word = english_dictionary.is_word?('monkey')
      expect(is_word).to be_truthy
    end
  end
end
