\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/8 \tempoMarkup "[Tempo variabile]"
    \partial 8 d'8 cis( e) d-! fis-!
    e16 fis g e fis8 d\p
    cis( e) d fis,
    e16 fis g e fis8 d'\f
    \time 12/8 h h' a g fis e a, a' g fis e d
    g, g' fis e d cis d a fis d fis a\p
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/8 \tempoMarkup "[Tempo variabile]"
    \partial 8 fis8 e( g) fis-! d'-!
    cis16 d e cis d8 fis,\p
    e( g) fis-! d-!
    cis16 d e cis d8 d'
    \time 12/8 h4.~ h8 a g a4.~ a8 g fis
    g4.~ g8 fis e fis4 d8 fis4 a8\p
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/8 \tempoMarkup "[Tempo variabile]"
    \partial 8 d8 a'4-! d,-!
    a d
    a' d,
    a d
    \time 12/8 g4. e4 cis'8 fis,4. d4 h'8
    e,4. cis4 a'8 d,4. r8 r fis\p
  }
}

BassFigures = \figuremode {
  r8 r2
  r
  r
  r
  r1.
  r2. r4. r4 <6>8
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
