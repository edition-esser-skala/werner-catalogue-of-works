\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 d'4. e8
    f8. f16 g8 a b cis, d e
    f16 g f e d8 g16 f es f es d c8 f16 es
    d es d c b8 es16 d c d c b a8 d16 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegro"
    g'4. a8 b8. b16 c8 d
    es fis, g a b16 c b a g8 f16 e
    d8 d'16 c b c b a g b a g f g f e
    d8 d'16 c b c b a g8 c16 b a b a g
    f8 b16 a g a g f es8 a16 g fis g \hA fis e
  }
}

Organo = {
  \relative c {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Allegro"
    g''4. a8 b8. b16 c8 d
    es fis, g a << {
      d4. e8
      f8. f16 g8 a b cis, d e
      f16 g f e d8 g16 f es f es d c8 f16 es
      d es d c b8 es16 d c d c b a8 d16 c
    } \\ {
      b16 c b a g8 f16 e
      d8 d'16 c b c b a g8 a16 g f g f e
      d8 d'16 c b c b a g8 c16 b a b a g
      f8 b16 a g a g f es8 a16 g fis g \hA fis e?
    } >>
  }
}

BassFigures = \figuremode {
  %tacet
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
