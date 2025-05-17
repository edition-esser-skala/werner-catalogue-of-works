\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Tempo ordinario"
    \partial 16 a''16(\p e2) \grace fis8 e2
    \grace e8 d16\f \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 cis32 e, a cis e[ a, cis e] a8 r
    \grace e8 d16\p \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 cis32 e, a cis e[ a, cis e] a8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Tempo ordinario"
    \partial 16 cis'16\p cis2 \grace d8 cis2
    \grace cis8 h16\f \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 a32[ cis, e a] cis cis, e a cis8 r
    \grace cis8 h16\p \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 \grace cis8 h16 a32[ cis, e a] cis cis, e a cis8 r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Tempo ordinario"
    \partial 16 r16 r a'\p a a a a a a r a a a a a a a
    gis4\f r8 gis a16 a a a a a a a
    gis4\p r8 gis a16 a a a a a a a
  }
}

BassFigures = \figuremode {
  r16 r1
  <6 5!>1
  q
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
