# Unidecoder

This library provides methods to transliterate Unicode characters to an ASCII
approximation.

The functionality in this library was originally written by [Russel Norris](http://github.com/rsl)
for his [Stringex library](http://github.com/rsl/stringex). This gem is an
extraction of the Unicode transliteration functionality from Stringex into a
separate library with some added functionality.

The Unidecoder component of Stringex is itself a port of Sean M. Burke's
[Unidecode](http://search.cpan.org/dist/Text-Unidecode/lib/Text/Unidecode.pm)
Perl module.

## Installation

    gem install unidecoder

## Usage

    Unidecoder.decode("olá, mundo!")       #=> "ola, mundo!"
    Unidecoder.decode("你好")               #=> "Ni Hao "
    Unidecoder.decode("Jürgen Müller")     #=> "Jurgen Muller"
    Unidecoder.decode("Jürgen Müller", "ü" => "ue")  #=> "Juergen Mueller"

Or, if you'd like to add a #to_ascii method to all strings
that runs Unicoder.decode, just require the string extensions:

    require 'unidecoder/string_extensions'
    "olá, mundo!".to_ascii       #=> "ola, mundo!"
    "Jürgen Müller".to_ascii("ü" => "ue")  #=> "Juergen Mueller"


## Warnings

While this is a neat trick, in practice many transliterations end up being
fairly useless. For example, all Chinese characters are transliterated to
Mandarin Chinese. Since Japanese uses Chinese characters writing, but
pronounces them differently from Mandarin, this makes the transliteration of
Japanese with this library useless.

Some languages, like Russian, would most correctly transliterate some letters
based on context, rather than a 1-1 mapping with ASCII. This library does not
do that.

Other languages, like Hebrew and Arabic, don't write vowels, but assume them
from context, so the ASCII representation of these langages given by this
library will look fairly ugly to native speakers.

Basically, your milage may vary. I don't speak every language used by this
library, so there are certain to be limitations and errors. Your feedback is
most appreciated!
