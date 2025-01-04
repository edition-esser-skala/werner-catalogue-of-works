\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r16^\part "Jobs Frau" a' a a a e g a f8 f \clef tenor r^\part Job a,
    c! c c16 c es d b8 b \fC r^\part Eliphas d
    d a c d h8. h16 h8 \fC d^\part Leviathan
    c g es' c c g r4
    \clef bass r16^\part Schöpffer g g g c g b c a8 a16 \clef tenor c^\part Job f4
  }
}

SoliLyrics = \lyricmode {
  So iſt dan al -- les Leyd ver -- ſchwun -- den? Die --
  weill ich wie -- der Gnad ge -- fun -- den. Ein
  ſel -- za -- me Ver -- en -- de -- rung. Und
  ich fahl in Ver -- zweiff -- lung.
  So pfleg ich mei -- ne Freund zu züch -- ten. Ô Herr!
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    cis2 a~
    a d
    fis f
    es4 fis g f
    e2 f
  }
}

BassFigures = \figuremode {
  <6>2 <6>
  r <6->
  <6> <4!>
  <6>4 <7- 5> <4> <4!>
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
