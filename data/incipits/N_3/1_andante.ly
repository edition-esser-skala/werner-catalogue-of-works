\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante mà non troppo"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4. g16( d) e8 c16( g)
    d'4. h16( g) c( a) fis( d)
    g( a) h( g) d'( h) g( d) c'( a) fis( d)
    g2 r4
    R2.*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Andante mà non troppo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    d'4. g16( d) e8 c16( g)
    d'4. h16( g) c( a) fis( d)
    g( a) h( g) d'( h) g( d) c'( a) fis( d)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \tempoMarkup "Andante mà non troppo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*6
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Andante mà non troppo"
      \once \override Staff.TimeSignature.style = #'single-digit
    g2.~
    g~
    g~
    g~
    g~
    g
  }
}

BassFigures = \figuremode {
  <5 3>2 <6 4>4
  <5 3>2 <7\\ 4 2>4
  <3>2 <7\\ 4 2>4
  <3>2 <6 4>4
  <3>2 <7\\ 4 2>4
  <3>2 <7\\ 4 2>4
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
