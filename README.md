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

    "olá, mundo!".to_ascii                 #=> "ola, mundo!"
    "你好".to_ascii                        #=> "Ni Hao "
    "Jürgen Müller".to_ascii               #=> "Jurgen Muller"
    "Jürgen Müller".to_ascii("ü" => "ue")  #=> "Juergen Mueller"

## Extra stuff

If you also install either the [Unicode](http://github.com/blackwinter/unicode)
**or** [Active Support](http://github.com/rails/rails) gems, Unidecoder will
also perform Unicode normalization before attempting to transliterate strings
to ASCII.

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
