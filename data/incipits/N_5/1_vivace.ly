\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4\f d, fis'
    d d, fis'
    d cis8 h a g
    fis4 a' a
    a,8( e') g4 fis8( d)
    cis( e) a4 fis8( d)
    a( e') g4 fis8( d)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4\f d, fis'
    d d, fis'
    d cis8 h a g
    fis4 fis' fis
    a,8( cis) e4 d
    cis2 d4
    a8( cis) e4 d
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4\f d, r
    d' d, r
    d' cis8 h a g
    fis4 d r
    e cis8( e) a,4
    a2 r4
    e' cis8( e) a,4
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    d'4\f d, r
    d' d, r
    d' cis8 h a g
    fis4 d r
    cis2 d4
    a2 d4
    cis2 d4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <6>4 <5>2
  r2.
  <6>4 <5>2
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
