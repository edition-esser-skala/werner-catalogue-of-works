\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 d'8 d d cis16 h
    cis8 a \hA cis e g g g fis16 e
    fis g fis e d e c d h g h d g h a g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    g'8 g g fis16 e fis8 d fis a
    c c c h16 a h c h a g h a g
    a8 g16 fis e fis e d cis8 e'16 d cis a h \hA cis
    d8 d,16 e fis g a fis d h d g h d8 e16
  }
}

Organo = {
  \relative c {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    g''8-! g-! g-! fis16 e fis8 d fis a
    c c c h16 a << {
      d8 d d cis16 h
      cis8 a \hA cis e g g g fis16 e
      fis g fis e d e c d
    } \\ {
      h16 c h a g h a g
      a8 g16 fis e fis e d cis8 e'16 d cis a h \hA cis
      d8 d,16 e fis g a fis
    } >> \clef bass g,8 g g fis16 e
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
