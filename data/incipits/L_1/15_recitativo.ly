\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 e16 e a a a c f,8. f16 a8 f
    e8. e16 e8 gis h8. h16 h8 d16 c
    a8 a r c g8. g16 h8 g
    e8. e16 e8 g a f d8. c16
  }
}

SoliLyrics = \lyricmode {
  Hoch -- ge -- neig -- te Com -- pa -- gnie, ich glaub ihr
  hö -- ret nie daß mich je -- mand noch ge --
  ſchän -- det und mein Pa -- quet ſonſt
  ü -- bel hätt an ſei -- nen Leib "ver -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    a2 a
    gis1
    a2 h
    c f4 fis
  }
}

BassFigures = \figuremode {
  r2 <6>
  r1
  r2 <6>
  r1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Arzt"
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
