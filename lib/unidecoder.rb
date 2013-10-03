require "yaml"

# Utilities for transliterating UTF-8 strings to ASCII.
module Unidecoder

  # Contains Unicode codepoints, loading as needed from YAML files.
  CODEPOINTS = Hash.new { |h, k|
    h[k] = YAML::load_file(File.expand_path("../unidecoder/data/#{k}.yml", __FILE__))
  } unless defined?(CODEPOINTS)

  module StringExtensions
    # Returns string with its UTF-8 characters transliterated to ASCII ones. Example:
    #
    #   "⠋⠗⠁⠝⠉⠑".to_ascii #=> "braille"
    def to_ascii(*args)
      Unidecoder.decode(self, *args)
    end
  end

  extend self
  # Transliterates UTF-8 characters to ASCII.
  #
  # @param [#to_s] string The string or string-like object to transliterate.
  # @param [Hash] overrides A Hash of UTF-8 to ASCII characters to use in
  #   place of the defaults.  This can be used for language-specific
  #   transliterations.
  #
  # @example
  #
  #     Unidecoder.decode("你好")                        #=> "Ni Hao"
  #     Unidecoder.decode("Jürgen Müller", "ü" => "ue")  #=> "Juergen Mueller"
  #     Unidecoder.decode("feliz año", "ñ" => "ni") #=>  #=> "feliz anio"
  #
  # @return [String] The transliterated string.
  def decode(string, overrides = nil)
    validate_utf8!(string)
    normalize(string.to_s).gsub(/[^\x00-\x7f]/u) do |char|
      begin
        decode_overridden(char, overrides) or decode_char(char)
      rescue
        "?"
      end
    end
  end

  def validate_utf8!(string)
    string.unpack("U*")
  end

  # Returns a UTF-8 character for the given UTF-8 codepoint
  def encode(codepoint)
    [codepoint.to_i(16)].pack("U")
  end

  # Returns string indicating which file (and line) contains the
  # transliteration value for the character. This is useful only for
  # development.
  def in_yaml_file(character)
    unpacked = character.unpack("U")[0]
    "#{code_group(unpacked)}.yml (line #{grouped_point(unpacked) + 2})"
  end

  def define_normalize(library = nil, &block)
    return if method_defined? :normalize
    begin
      require library if library
      define_method(:normalize, &block)
    rescue LoadError
    end
  end

  define_normalize("unicode") {|str| Unicode.normalize_C(str)}
  define_normalize("active_support") {|str| ActiveSupport::Multibyte::Chars.new(str).normalize(:c).to_s}
  define_normalize {|str| str}

  def decode_char(char)
    unpacked = char.unpack("U")[0]
    CODEPOINTS[code_group(unpacked)][grouped_point(unpacked)]
  end

  def decode_overridden(char, overrides)
    overrides[char] if overrides
  end

  # Returns the Unicode codepoint grouping for the given character
  def code_group(unpacked_character)
    "x%02x" % (unpacked_character >> 8)
  end

  # Returns the index of the given character in the YAML file for its codepoint group
  def grouped_point(unpacked_character)
    unpacked_character & 255
  end
end

class String
  include Unidecoder::StringExtensions
end
