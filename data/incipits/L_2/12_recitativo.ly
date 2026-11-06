\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schullmeiſter" h h16 h e h g8. g16 g8 h
    d d d h16 g e'8. e16 e8 e
    gis, h d e c c16 e a, a a gis!
    h8 h16 \fC h^\part "Schwabnwürth" h h c d c8 c16 c c8 e
  }
}

SoliLyrics = \lyricmode {
  Mei Moä -- nung bleibt halt wie zu -- vor daß
  man den Par -- thl alß Se -- ni -- or zum
  Rich -- ter Ambt er -- wöh -- let ſo wär als guet be --
  ſtel -- let. Mir brau -- chä ja än höff -- li -- chä Männ der
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    e2 h~
    h c
    h a4 f'
    e2 e
  }
}

BassFigures = \figuremode {
  r2 <6>
  r1
  <6\\>2. <6>4
  <_+>2 <6 _!>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
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
