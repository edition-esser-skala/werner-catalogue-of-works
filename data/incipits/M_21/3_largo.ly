\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4 a r8 r16 d
    g,4 g r
    g g r8 r16 a
    fis4 fis r
    g g r8 r16 d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 f r8 r16 f
    e4 e r
    e e r8 r16 e
    es4 es r
    d d r8 r16 d
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4 d r8 r16 d
    d4 d r
    cis cis r8 r16 cis
    c4 c r
    b b r8 r16 b
  }
}

BassFigures = \figuremode {
  r2.
  <4 2>
  <6 5>2 r8. <\t \t>16
  <4+ _->2.
  <6>2 r8. <\t>16
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
