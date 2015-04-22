require 'werd/dictionary'

module Werd
  def self.fail(message='')
    raise message
  end

  def self.dictionary_in(language, min_letter_cnt=3)
    Werd::Dictionary.from_file(
      File.expand_path("../../dictionaries/#{language.to_s.downcase}", __FILE__),
      min_letter_cnt,
    )
  end
end

############################################
## Standard library extensions
############################################
class Hash
  # Similar to Hash.invert, but values are stored in an array to avoid overwrites
  def safe_invert
    each_with_object({}) do |(key, value), out|
      out[value] ||= []
      out[value] << key
    end
  end
end
