\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Larghetto"
    r8 a'' a a, a4
    r8 b' b b, b4
    r8 c' c c, d f,
    f( e) e4 r
    r8 es' es16\trill d es8 es16\trill d es8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    r8 f' f f, f4
    r8 g' g g, g4
    r8 a' a a, b a
    a( g) g4 r
    r8 c c16\trill b c8 c16\trill b c8
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    c4 r8 c c c
    c4 r8 g' g g
    c,4 r8 f d4
    c8 e e g g( f)
    f4 r g
  }
}

Cello = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Larghetto"
    f4 r8 f f f
    e4 r8 e e e
    f4 r8 f b, d
    c c' c b b a
    a4 r g
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "vlc"
        \Cello
      }
    >>
  >>
}
