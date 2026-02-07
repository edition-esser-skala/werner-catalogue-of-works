\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*2
    r2 d e
    f g a
    b1.
    a2 r r
    r g b
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve --
  nit
  in "no -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 d c4 b
    a2 b c
    d4 e f2 g
    c,1 c2
    d1 e2
    f d f~
    f e4 d e2
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- _
  di -- ctus, qui
  ve -- _ nit, qui
  ve -- nit
  in no --
  _ mi -- ne __
  Do -- _ "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 d, e
    f g a
    b1.
    a2 r r
    r g c~
    c b a
    g1 g2
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve --
  nit
  in no --
  mi -- ne
  Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \clef tenor \time 3/2 \tempoMarkup "[no tempo]"
    d1 e2
    f g a
    b1.
    a2 r c
    d g, c~
    c b a
    g1 g2
  }
}

BassFigures = \figuremode {
  r1 <6>2
  r1.
  <5 3>1 <6 4!>2
  <6>1 q2
  <6->1.
  <4 2>1 <6>2
  <7> <6>1
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
