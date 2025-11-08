\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    f'!8. b16 d,4 es
    f8. g16 a,4 b
    c8. d16 f,4 es
    d c8 d b4
    \tuplet 3/2 4 { d'8 c b } f'2
    f8 e d c b a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    f'!8. b16 d,4 es \noBreak
    f8. g16 a,4 b
    c8. d16 f,4 es
    d c8 d b4
    \tuplet 3/2 4 { d'8 c b } f'2
    f8 e d c b a
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key b \major \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 b c
    r f g
    a2 f4
    b2 b,4
    r b' b,
    a'2 f4
  }
}

BassFigures = \figuremode {
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
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
