# Unidecoder

This library provides methods to transliterate Unicode characters to an ASCII
approximation.

The functionality in this library was originally written by [Russel Norris](http://github.com/rsl)
for his [Stringex library](http://github.com/rsl/stringex). This gem is an
extraction of the Unicode transliteration functionality from Stringex into a
separate library with some added functionality.

The Unidecoder component of Stringex is itself a port of Sean M. Burke's
[Unidecode](http://search.cpan.org/dist/Text-Unidecode/lib/Text/Unidecode.pm)
Unidecode Perl module.

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
