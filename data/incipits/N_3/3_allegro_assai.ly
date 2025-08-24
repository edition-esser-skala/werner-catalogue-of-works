\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    h'16 c d8. g16
    h, c d8. g16
    fis g a h c8
    h a r
    fis,16 g a h c8
    h a r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    r8 h'16 a g8
    r h16 a g8
    d'16 e fis g a8
    g fis r
    d,16 e fis g a8
    g fis r
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    r8 d16 c h8
    r d16 c h8
    r d d
    d d r
    r d d
    d d r
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    g'8 g, r
    g' g, r
    r d'' fis,
    g d r
    r d fis,
    g d r
  }
}

BassFigures = \figuremode {
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
