\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    e'2.~
    e8 c a4 a'
    \grace a8 gis2 r4
    e,8 a e'4 d
    \grace d8 c2 r4
    a h8( cis) cis8.\trill h32( \hA cis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    e'2.~
    e8 c a4 a'
    \grace a8 gis2 r4
    e,8 a e'4 d
    \grace d8 c2 r4
    a h8( cis) cis8.\trill h32( \hA cis)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    a'8 h c4 h
    a g f
    e8 h' e4 d
    c c, h
    a8 e' a4 g
    r f e
  }
}

BassFigures = \figuremode {
  r2.
  r4 <_ 2> <6 \t>
  <_+> q <\t>
  <6> <3> q
  r2.
  r4 <4> <6\\>
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
