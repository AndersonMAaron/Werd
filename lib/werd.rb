module Werd

  def self.fail(message='')
    raise message
  end

  def self.dictionary_in(language)
    Werd::Dictionary.from_file(
      File.absolute_path(
        File.expand_path("../../dictionaries/#{language.to_s}", __FILE__)
      )
    )
  end
end
