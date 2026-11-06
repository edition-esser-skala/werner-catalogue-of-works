\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schnepfendrekh" a a16 a d a fis8. fis16 fis8 fis
    a8. a16 a8 h g8. g16 g4
    r8 h h16 h e h c8. c16 c8 a
    f' d c a a8. e16 e4
  }
}

SoliLyrics = \lyricmode {
  Wälß mi den all zum Rich -- ter wolt, ſo
  merkh I daß I fol -- gen ſolt,
  der Schull -- fur ſoll an mei -- ner ſtat ſchön
  dan -- cken al -- len vor dö Gnad.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 dis~
    dis h
    gis a
    d e4. e,8
  }
}

BassFigures = \figuremode {
  <_+>2 <6>
  r <6>
  r1
  r2 <4>4 <_+>
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
