\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Larghetto"
    a'16(\p e') e8 r16 f e d c( h) a8 r16 f' e d
    c( h) a( h) c8.\trill c16 \grace c8 h4 r16 h c d
    c h a8 r16 d e f e d c8 r16 fis g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Larghetto"
    r8 c'16(\p a) h8. h16 e,8 c'16( a) h8. h16
    e,8 c'16( h) a8. a16 gis16. gis32 a16 h e,4
    r8 c'4 h8 r e4 dis8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Larghetto"
    a'8\p a gis gis a a gis gis
    a a dis, dis e e gis gis
    a a g g c c h h
  }
}

BassFigures = \figuremode {
  r1
  r4 <7 5> <_+>2
  r4 <4>8 <3> r4 <4>8 <_+>
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
