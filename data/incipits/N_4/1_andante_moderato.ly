\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4. e16( d) fis( d) g( e)
    fis4. g16( fis) a( fis) h( g)
    a( fis) h( g) a( fis) a( d) h( g') e( cis)
    d( a) h( g) a( fis) a( d) h( g') e( cis)
    d8~ d32 e fis g a16-! a-! a-! a-! a( h) g( e)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    d4. e16( d) fis( d) g( e)
    fis( d) g( e) fis( d) fis( a) g( e') cis( a)
    fis8 g16( e) fis( d) fis( a) g( e') cis( a)
    fis( a) d32( cis d e) fis16-! fis-! fis-! fis-! fis( g) e( cis)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis8( d) d2
    a'8( d,) d2~
    d8( cis) d( d') h( cis)
    d,( cis) d( d') h( cis)
    d d,32( e fis g) a16-! a-! a-! a-! a( h) g( e)
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Andante moderato"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'8( d,) d2
    d'8( d,) d2~
    d2.~-\tasto
    d~
    d~
  }
}

BassFigures = \figuremode {
  %tacet
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
