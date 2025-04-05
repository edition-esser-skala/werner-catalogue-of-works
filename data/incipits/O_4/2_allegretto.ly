\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Allegretto"
    d'4. a'16( fis) h( g) e( cis)
    d8 a16( d,) h'( d,) a'( d,) h'( d,) cis'( d,)
    d'4. a'16( fis) h( g) e( cis)
    d8 a16( d,) h'( d,) a'( d,) h'( d,) cis'( d,)
    d'( a) fis'( a,) g'( a,) fis'( a,) g'( a,) e'( a,)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Allegretto"
    fis4. d'8 h cis
    d fis, g fis g e
    fis4. d'8 h cis
    d fis, g fis g e
    fis a h a h cis
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Allegretto"
    d4 d'8 fis, g a
    d,2.~-\tasto
    d4 d'8 fis, g a
    d,2.~
    d
  }
}

BassFigures = \figuremode {
  r4. <6>8 <6 5>4
  r2.
  r4. <6>8 <6 5>4
  r2.
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
