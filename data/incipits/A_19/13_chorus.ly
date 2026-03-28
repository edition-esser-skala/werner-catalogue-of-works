\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r8 a' d4 r8 a e'4
    r8 d d d es4. es8
    d8 d d d f!4. f8
    e4 r r8 g, g a
    f4 r r8 c'! c d
  }
}

SopranoLyrics = \lyricmode {
  Ja Held! Ja Held!
  Zeig unß die Groß -- muths
  Weeg, zeig unß die Groß -- muths
  Weeg wan un -- ſer
  Bluet, wan un -- ſer
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 r8 f e4 r8 e
    f4 r r8 fis fis fis
    g4 r r8 gis gis gis
    a e e f g4 r
    r8 f fis g a g4 a8
  }
}

AltoLyrics = \lyricmode {
  Ja Held! Ja
  Held! Zeig unß die
  Weeg, zeig unß die
  Weeg wan un -- ſer Bluet,
  wan un -- ſer Bluet, un -- ſer
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 r8 a a4 r8 a
    a4 r r8 a a a
    b4 r r8 h h h
    cis a \hA cis d e d4 e8
    a, a a b c4 r
  }
}

TenoreLyrics = \lyricmode {
  Ja Held! Ja
  Held! Zeig unß die
  Weeg, zeig unß die
  Weeg wan un -- ſer Bluet, un -- ſer
  Bluet, wan un -- ſer Bluet
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 r8 d cis4 r8 \hA cis
    d4 r r8 c c c
    b4 r r8 d d d
    cis4 r r8 h h cis
    d4 r r8 e e fis
  }
}

BassoLyrics = \lyricmode {
  Ja Held! Ja
  Held! Zeig unß die
  Weeg, zeig unß die
  Weeg wan un -- ſer
  Bluet, wan un -- ſer
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    d4 r8 d cis4 r8 \hA cis
    d4 r r8 c c c
    b4 r r8 d d d
    cis4 r r8 h h cis
    d4 r r8 e e fis
  }
}

BassFigures = \figuremode {
  r1
  r2 r8 <4\+ _->4.
  <6>2 r8 <4\+ _!>4.
  <6>2 r8 <6>4 <\t>8
  r2 r8 <6>4 <\t>8
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
