\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "St: Michael" d fis16 fis g a cis,4 r8 e
    g8. g16 a8 e fis8. fis16 fis8 a
    d, d e h cis4 \clef soprano r8^\part "St: Magdalena" a'
    d d d a h4 r8 fis
    a a c! h g g \clef tenor r h,^\part "Lucifer"
    e8. e16 e8 e e h16 h d d e h
  }
}

SoliLyrics = \lyricmode {
  Kom mein ver -- lieb -- te Braut und
  fol -- ge mir, nit förch -- te dir, geh
  ſi -- cher und ver -- traut. Wie
  iſt mir umb daß Hertz, ich
  möcht vor Angſt ver -- za -- gen. Ge --
  rech -- ter Rich -- ter hö -- re, ver -- neh -- me mei -- ne
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis2 e
    cis d
    h a
    fis' dis~
    dis e
    c gis
  }
}

BassFigures = \figuremode {
  <6>2 <6\\>
  <6 5> <_+>
  <7>4 <6\\> <_+>2
  <6> <6>
  <7 5>1
  r2 <6>
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
