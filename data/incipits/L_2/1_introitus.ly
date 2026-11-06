\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g''4 g
    g8. h32 a g8 d
    e d e fis
    g8. h32 a g8 d
    e d e fis
    g2~\trill
    g~\trill
    g4. a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g''4 g
    g8. h32 a g8 d
    c h c a
    h8. d32 c h8 d
    e d e c'
    d, c d h'
    e, d e c'
    d, c d4
  }
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g'4 g,
    g r
    R2
    g'4 r8 h
    c h c a
    h a h g
    c h c a
    h a h fis
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
