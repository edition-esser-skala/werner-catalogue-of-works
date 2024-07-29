\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'4~ e16 d c h c4~
    c16 h a gis a4. f'8
    e16 d c h d c h a gis fis e d
    c8 a r4 r
    g''!~ g16 f e d e4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 c' c16 h a g
    a4~ a16 g f e f8 a
    gis a h16 a gis fis e d c h
    a8 a' h16 c d c d8 f,
    e4 e' e16 d c h
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 a'~ a16 g f e
    f4 f16 e d c d4
    r8 f d4 e
    a,8 c' d16 c h a g! f e d
    c4 c' c16 h a g
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
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
}
