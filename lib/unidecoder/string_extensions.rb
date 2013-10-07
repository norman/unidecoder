module Unidecoder
  module StringExtensions
    # Returns string with its UTF-8 characters transliterated to ASCII ones. Example:
    #
    #   "⠋⠗⠁⠝⠉⠑".to_ascii #=> "braille"
    def to_ascii(*args)
      Unidecoder.decode(self, *args)
    end
  end
end

class String
  include Unidecoder::StringExtensions
end