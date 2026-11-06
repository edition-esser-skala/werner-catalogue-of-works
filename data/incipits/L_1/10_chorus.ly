\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 12/8 \tempoMarkup "Allegro"
    \partial 8 c'8\f f f f f f f f f f f f f
    g g g g g g a16 b c b a g f8 g a
    g16 f g8 c, a'16 g a8 c, g'16 f g8 c, c'4.~
    c8 c c h h h c c, e g e g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 12/8 \tempoMarkup "Allegro"
    \partial 8 r8 r4 r8 r r c'\f f f f f f f
    f f f e e e f4. r8 r f,
    c' c c c c c c c c c c c
    d d d d d d e16 f g f e d c4.
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key f \major \time 12/8 \tempoMarkup "Allegro"
    \partial 8 r8 f4.\f a d, a
    b c f,4 f'8 a g f
    e4. f e a
    f g c, e
  }
}

BassFigures = \figuremode {
  r8 r2. r4. <6>
  <6 5>1.
  r
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
