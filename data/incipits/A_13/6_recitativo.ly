\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schöpffer" d, a'16 a a h c8 c16 a a a c h
    g8 g r g g h g d
    e e16 e a a cis a fis8 fis r cis'
    e, e g fis d d16 \clef tenor fis^\part "Gerechtigkeit" h h h d
    d8. a16 a8 h c c e d %5
  }
}

SoliLyrics = \lyricmode {
  Nun iſt es ſchon be -- ſchloſ -- ſen, ich kan mein Worth nicht
  bre -- chen, der Menſch ſoll ins Ver --
  der -- ben des bit -- tern Tod -- tes ſter -- ben, auf
  e -- wig ſeyn ver -- ſtoſ -- ſen. Ge -- rech -- ter Rich -- ter
  hö -- re mich ver -- mög der Bil -- "lig -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis2 dis
    e h
    cis ais
    ais h
    fis'1
  }
}

BassFigures = \figuremode {
  <6>2 <7 5>
  r <6>
  <6> <6\\>
  <7 5>1
  <6>2 <5>
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
