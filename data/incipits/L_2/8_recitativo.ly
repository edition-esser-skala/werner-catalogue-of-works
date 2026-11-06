\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schnepfendrekh" r16 a d d f d b8. b16 b8 a
    f4 r8 a c!16 c c c e8 c
    a a a16 a d a b8. b16 b b c d
    c8 c e c a16. a32 a16 \fC a^\part "Schwabnwürth" a a g f
  }
}

SoliLyrics = \lyricmode {
  Nä nä auß dei -- ner Wahl wird nit viel
  drauß, der Bar -- thl -- me hats hin -- tern
  Ohrn er ſticht uns d’Nar -- ren hint und vorn, äs wurd bald
  hoäſ -- ſen bloß märn Ho -- bl auß. Der Bruä -- der Schne -- "pfä -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 cis
    d e
    f4 fis g2
    e f
  }
}

BassFigures = \figuremode {
  r2 <7- 5>
  r <6>
  r4 <6> <_->2
  <6>1
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
