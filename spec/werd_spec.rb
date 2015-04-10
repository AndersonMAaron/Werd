require_relative 'spec_helper'

describe "Werd" do
  describe "loading dictionaries" do
    it "can load an english dictionary" do
      dictionary = Werd.dictionary_in(:english, minimum_letters=3)
      expect(dictionary).not_to be_nil

      expect(dictionary.words).to include('ancestor')
      expect(dictionary.words).to include('protect')
      expect(dictionary.words).not_to include('me') # minimum word length is 3
    end
  end

  describe "fatal errors" do
    it "can raise a fatal error with a specified message" do
      expect {
        Werd.fail('fail message')
      }.to raise_error('fail message')
    end
  end
end
