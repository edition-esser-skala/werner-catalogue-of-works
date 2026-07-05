\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schöpffer" d, fis a d, \hA fis a16 c b a
    b8 b \clef tenor r d^\part "Gerechtigkeit" d8. g,16 g8 g
    cis8. cis16 e8 g, a a16 \fC a^\part "Adam" a a d a
    b8. b16 b8 \clef soprano d'^\part "Barmherzigkeit" g, h d es
    c8. c16 c8 r16 c c8 g b c
  }
}

SoliLyrics = \lyricmode {
  Woll -- an! der Streut muß nun ſein End ge --
  win -- nen. Barm -- her -- zig -- keit gleich
  pack -- he dich von hin -- nen! So iſt dan gar kein
  Hoff -- nung mehr. Ô Gott halt ein zu
  dei -- ner Ehr, wie wär es wan ein
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis1
    g2 es
    e d~
    d h!
    c e!
  }
}

BassFigures = \figuremode {
  <6>1
  <_->2 <7>
  <6\\> <_+>
  <6-> <6>
  <_-> <6>
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
