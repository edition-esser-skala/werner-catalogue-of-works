\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a'1 a
    d,2 d'1 c2
    b1 a2 d~
    d c b4 c d c8[ b]
    a2 f r1
  }
}

SopranoLyrics = \lyricmode {
  In mon --
  te o -- li --
  ve -- ti, o --
  li -- ve -- _ _ _
  _ ti,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*5
    d1 d
  }
}

AltoLyrics = \lyricmode {
  In "mon -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a1 a
    d,2 d'1 c2
    b1 a~
    a2 g1 f2
    e1 r2 g
    a d d4 c b c
  }
}

TenoreLyrics = \lyricmode {
  In mon --
  te o -- li --
  ve -- _
  _ _
  ti, in
  mon -- te o -- _ "li -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    d1 d
    a2 a'1 g2
    f4 e d c b2 g
  }
}

BassoLyrics = \lyricmode {
  In mon --
  te o -- li --
  ve -- _ _ _ _ ti,
}

Organo = {
  \relative c {
    \clef tenor
    \twotwotime \key d \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    a'1-! a-!
    d,2 d'1 c2
    b1 a
    \clef bass d, d
    a2 a'1 g2
    f4 e d c b2 << { g' } \\ { g, } >>
  }
}

BassFigures = \figuremode {
  r\breve
  <12>2 <5>1 r2
  <3> <10> <4> <3>
  <6> <\t 4> <5 \t> <\t 3>
  <4> <3> <2>1
  <6>\breve
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
