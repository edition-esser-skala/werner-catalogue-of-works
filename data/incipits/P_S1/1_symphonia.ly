\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    g''8.^\partVi d16 d16. b32 b16. g32 g8. d16 d16. b32 b16. g32
    g8 b'' \tuplet 3/2 8 { d16[ c b] c b a } b8 b, \tuplet 3/2 8 { d16[ c b] c b a }
    b8. h16 h8. c16 c8. cis16 cis8. d16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    g''8.^\partVi d16 d16. b32 b16. g32 g8. d16 d16. b32 b16. g32
    g8 g'' \tuplet 3/2 8 { b16[ a g] a g fis } g8 g, \tuplet 3/2 8 { b16[ a g] a g fis }
    g4 r \tuplet 3/2 8 { g16 f es es[ d c] } e8. g16
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    g8 g g g g8. d'16 d16. b32 b16. g32
    g4 r g8 g' r4
    g8 g, \tuplet 3/2 8 { g'16 f! es f[ es d] } es8 c \tuplet 3/2 8 { a'16[ g f] g f e }
  }
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
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
