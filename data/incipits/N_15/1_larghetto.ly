\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
    g''2 h8( g)
    d'2 h8( g)
    d2 h8( g)
    d2 fis8( a)
    c2 a8( fis)
    g2 h8( d)
    c2 a8( fis)
    g4. a8 h cis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
    g'2 h8( g)
    d'2 h8( g)
    d2 h8( g)
    d'( d') a( fis) d( fis)
    a4 c a8( fis)
    g2 d8( h')
    a4 c a8( fis)
    g4 h2
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
    g'2 h8( g)
    d'2 h8( g)
    d2 h8( g)
    d2 r4
    r d'8( a') fis( d)
    h'( g) d( h) g4
    r d'8( a') fis( d)
    h'( g) d( h) g4
  }
}

Cembalo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
    g'2 h8( g)
    d'2 h8( g)
    d2 h8( g)
    d2.
    d'
    g,
    d'
    g,2 g'4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <7>
  r
  q
  r
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
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
