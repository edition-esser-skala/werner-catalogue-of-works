\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4 r8 d f f f a
    a8. e16 e8 a fis8. fis16 a8 b
    g4 r8 g g d f g
    e8. e16 e8 gis h gis e8. d16
  }
}

SoliLyrics = \lyricmode {
  Hiez hab i oä -- nen
  Vor -- thl glehrnt der koſt mi zwey Maß
  Wein den ſag i wär -- lä
  koä -- nen nit ſolts ä mei Va -- dä
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d1
    cis2 c
    b h
    gis1
  }
}

BassFigures = \figuremode {
  r1
  <6>2 <4\+ 2>
  <6>1
  q
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Sagfäller"
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
