\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro moderato"
    g'2\p g4
    g2 g4
    a a a
    a2 a4
    a a a8 a
    h4.\cresc h8 h4
    c c c
    d4. d8 d4
    e e c8-!\f c-!
  }
}

SopranoLyrics = \lyricmode {
  Vi -- di
  a -- quam
  e -- gre -- di --
  en -- tem
  de tem -- plo a
  la -- te -- re
  dex -- tro, a
  la -- te -- re
  dex -- tro, al -- "le -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro moderato"
    e2\p e4
    e2 e4
    e e e
    f2 f4
    f f f8 f
    f4.\cresc f8 f4
    e e g
    h4. h8 h4
    c c c8\f c
  }
}

AltoLyrics = \lyricmode {
  Vi -- di
  a -- quam
  e -- gre -- di --
  en -- tem
  de tem -- plo a
  la -- te -- re
  dex -- tro, a
  la -- te -- re
  dex -- tro, al -- "le -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro moderato"
    c2\p c4
    c2 c4
    c c c
    c2 c4
    d d d8 d
    d4. d8 d4
    c\cresc c e
    f4. f8 f4
    e e r\!
  }
}

TenoreLyrics = \lyricmode {
  Vi -- di
  a -- quam
  e -- gre -- di --
  en -- tem
  de tem -- plo a
  la -- te -- re
  dex -- tro, a
  la -- te -- re
  dex -- tro,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro moderato"
    c2\p c4
    c2 c4
    a a a
    f2 f4
    d' d d8 d
    g,4. g'8 g4
    g\cresc g g
    g4. g8 g4
    c, c r\!
  }
}

BassoLyrics = \lyricmode {
  Vi -- di
  a -- quam
  e -- gre -- di --
  en -- tem
  de tem -- plo a
  la -- te -- re
  dex -- tro, a
  la -- te -- re
  dex -- tro,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro moderato"
    c2.~\p
    c
    a
    f
    d'
    g,
    g4 r r
    g'2.(
    c,4) r r
  }
}

BassFigures = \figuremode {
  <5 3>2.
  <\t \t>
  r
  <3 5>
  <5 3>
  <7 5 3>
  <6 4>
  <3 7>
  r
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
