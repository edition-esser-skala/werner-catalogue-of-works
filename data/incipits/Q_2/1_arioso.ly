\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Arioso"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Arioso"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*5
  }
}

Violoncello = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \tempoMarkup "Arioso"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e a~
    a gis8 fis e d
    cis4 h8( a) fis'4
    a8 e d2\trill
    cis8 d e2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Arioso"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'8. h16 cis4 a
    e' e, gis
    a cis, d
    cis h e
    a,2 cis4
  }
}

BassFigures = \figuremode {
  r2.
  r4 <3>2
  r2.
  <6>4 <7> q
  r2.
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
        \set Staff.instrumentName = \markup \center-column { "vlc" "solo" }
        \Violoncello
      }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
