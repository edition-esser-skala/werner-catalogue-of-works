\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Lucifer" d a16 a a h g8 g16 g h h h c
    d8 d d16 d f e c8 c r e
    a, a h c c g r4
    r8 a cis16 cis e a, g8. g16 g8 a
    b g \hA b a f f r a
  }
}

SoliLyrics = \lyricmode {
  Nun iſt mein Neyd ge -- ſtil -- let, weil ich mein fin -- ſters
  Reich ſo woll be -- ſe -- tzet ſe -- he, und
  zahl -- reich an -- ge -- fül -- let. Hier
  wird die Ehr -- ſucht Je -- za -- bels mit
  Schmach und Schand er -- fül -- let, der
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis2 h,~
    h e
    f g4 g,
    cis2 cis~
    cis d~
  }
}

BassFigures = \figuremode {
  <6>2 q
  r q
  r <4>4 <3>
  <6>2 <7- 5>
  r1
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
  \layout { }
}
