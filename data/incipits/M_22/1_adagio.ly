\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    g''8( c,) c4 r8 r16 h
    c4 c, r8 r16 es'
    es8.[\trill d16 d8.\trill c16 c8.\trill b16]
    b2 r8 r16 es\p
    es8.[\trill d16 d8.\trill c16 c8.\trill b16]
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    es4 g r8 r16 d
    es4 es r8 r16 c'
    c8.[\trill b!16 b8.\trill as16 as8.\trill g16]
    g2 r8 r16 c\p
    c8.[\trill b16 b8.\trill as16 as8.\trill g16]
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4 es r8 r16 g
    c,4 c r
    r r r8 r16 es
    es4 es, r
    r r r8 r16 es''
  }
}

BassFigures = \figuremode {
  r4 <6> r8. <_!>16
  r2.
  r
  r
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
