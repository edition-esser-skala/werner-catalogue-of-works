\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    e'8. fis32 gis a8 e cis a fis'16 gis a8
    h dis, e16 fis gis8 a cis, d16 e fis8
    gis a16 h a4. gis16 fis gis4\trill
    a r e, e'~
    e8 fis16 e dis4. e16 \hA dis cis8 a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    R1*3
    a'8. cis32 d e8 a, gis e cis'16 dis e8
    fis ais, h16 cis dis8 e gis, a16 h cis8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    r2 a4 a'~
    a8 h16 a gis4. a16 gis fis8 d'
    e,4 r8 cis d16 e fis8 e d16 e
    cis8 a4 cis16 a e'4 r
    R1
  }
}

BassFigures = \figuremode {
  r2. <6\\>8 <5>
  <4\+ 2> <\t \t> <6>8 <5> <4 2> <\t \t> <6>4
  <_+>2 <6 5>4 <_+>
  r1
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
