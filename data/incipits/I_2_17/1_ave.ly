\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key f \major \time 2/2 \tempoMarkup "Alla capella"
    f4 f a, b
    c c' b a
    g c a f
    b a g c
    a g f e
    d c b a
    b g c c
    f f e d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key f \major \time 2/2 \tempoMarkup "Alla capella"
    f4 f a, b
    c c' b a
    g c a f
    b a g c
    a g f e
    d c b a
    b g c c
    f f e d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
      \key f \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    f1
    e2 d
    e c
    d e
    f1
    f
    g
    a
  }
}

SopranoLyrics = \lyricmode {
  A --
  _ _
  _ _
  _ _
  ve
  Re --
  gi --
  na
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    f1
    e2 d
    e c
    d e
    f1
    f
    g
    a
  }
}

AltoLyrics = \lyricmode {
  A --
  _ _
  _ _
  _ _
  ve
  Re --
  gi --
  na
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key f \major \time 2/2 \tempoMarkup "Alla capella"
    f4 f, a b
    c c' b a
    g c a f
    b a g c
    a g f e
    d c b a
    b g c c,
    f f' e d
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>2 q
  r q
  q1
  r
  <6 5>
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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
