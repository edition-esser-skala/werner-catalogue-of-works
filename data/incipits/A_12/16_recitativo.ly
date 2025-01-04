\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    a'8^\part "Jobs Frau" a f' d b8. b16 b8 g
    cis cis e g, f f a4
    r8 a a16 a c a gis8 h! e c
    ais16[ h] cis4 e,8 fis fis fis g
    a c e d h d4 h8
  }
}

SoliLyrics = \lyricmode {
  Ô daß gro -- ße Her -- tzen -- leyd ſo
  mei -- ne Seel em -- pfün -- det, wie,
  hab ich mich dan vil -- leicht geg’n Gott ſo
  ſchwär __ _ ver -- ſün -- det? Daß all
  Hoff -- nung von mir weicht und ſich
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 e~
    e d
    dis d4 c
    cis2 h
    fis' g4 f
  }
}

BassFigures = \figuremode {
  r2 <6\\ 5->
  r1
  <7 5>2 <4\+ 2>4 <6>
  <6\\>2 < _+>
  <6>2. <\t>4
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
