\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    a'2. a4 g2 a
    b1 a2 a
    d1. c2
    h1 a
    r g'2 d
  }
}

SopranoLyrics = \lyricmode {
  Vi -- ne -- a __ _
  me -- a e --
  le -- _
  _ cta
  quam "plan -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    f2 f1 e2
    f g1 f2
    r a gis a
    a gis a1
    R\breve
  }
}

AltoLyrics = \lyricmode {
  Vi -- ne -- a
  me -- _ a,
  me -- a e --
  le -- _ cta
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    c1 c2 c
    f,4 f' e d c2 c
    f1 e2 a,
    f' e e1
    r2 e1 h2
  }
}

TenoreLyrics = \lyricmode {
  Vi -- ne -- a
  me -- _ _ _ a e --
  le -- cta, e --
  le -- _ cta
  quam "plan -"
}


Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    f2. f4 c1
    d2 e f1
    r2 d e f
    d e a, a'~
    a e g!1
  }
}

BassoLyrics = \lyricmode {
  Vi -- ne -- a
  me -- _ a,
  me -- a e --
  le -- _ cta quam __
  plan -- "ta -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    f1 c
    d2 e f1
    r2 d e f
    d e a, a'~
    a e g!1
  }
}

BassFigures = \figuremode {
  r1 <5 4>2 <6 3>
  <6> <\t> <9> <8>
  r1 <7  _+>2 <5>
  <6 5> <_+>1 r2
  r1 <6 _!>
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
