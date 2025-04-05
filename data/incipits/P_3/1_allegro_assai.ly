\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro assai"
    r8 d f d
    b' f d' b
    f'16 f f f f f f f
    f f f f f f f f
    f f f f f f f f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro assai"
    r8 b d b
    f' d b' f
    d'16 f f f f f f f
    f f f f f f f f
    f f f f f f f f
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro assai"
    d4 r
    R2
    r8 d' c d
    a b f a
    d, d' c d
  }
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro assai"
    b4 r
    R2
    r8 b' a b
    f b d, f
    b, b' a b
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
  >>
}
