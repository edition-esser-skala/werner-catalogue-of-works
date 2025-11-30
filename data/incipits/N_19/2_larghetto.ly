\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'4 \tuplet 3/2 4 { b8\trill a b d\trill c d }
    g( g,) g2\trill
    es'8 d( c) b( a) g(
    fis2)\trill g8( a)
    d,2 a'4
    b g8( a) h4
    c8( d) es( d) es4
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*4
    g'4 \tuplet 3/2 4 { b8\trill a b d\trill c d }
    g( g,) g2\trill
    es'8 d( c) b( a) g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'\p a8.\trill g32( a)
    b8( c) c8.\trill b32 c d8( b)
    g4 \tuplet 3/2 4 { es'8 d es c b c }
    a8( g) fis( a) b( c)
    d2.
    g,
    es'8 d( c) b( a) g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*4
    r4 g'\p a8.\trill g32( a)
    b8( c) c8.\trill b32( c) d4
    g, es' c8( b)
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    g4 g' f
    es2 b4
    c2.
    d4 d' c
    b g f!
    es2 d4
    c2.
  }
}

BassFigures = \figuremode {
  r2.
  <5>4 <6> q
  r2 q4
  <_+>2 <\t>4
  <6>2.
  <5>4 <6> <6! 4>
  r2 <6>4
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "ob"
        \new Staff {
          \set Staff.instrumentName = "1"
          \OboeI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \OboeII
        }
      >>
    >>
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
