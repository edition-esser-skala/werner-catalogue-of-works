\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Adam" r8 e, a a c e
    gis, gis r h d d f e
    c c c e c g b c
    a4 r8 c es8. es16 es8 d
    b4 r8 g h h h16 h c d
  }
}

SoliLyrics = \lyricmode {
  Ô mich boß -- haff -- ten
  Men -- ſchen! was hab ich doch ge --
  dacht? daß ich mein Gott und ſein Ge --
  bott ſo ſchänd -- lich hab ver --
  acht. Das Kleid der Glo -- ri iſt "ver -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    a1
    h2 gis
    a e'
    f fis
    g f
  }
}

BassFigures = \figuremode {
  r1
  <6\\>
  r2 <6>
  r <7->
  <_-> <4!>
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
