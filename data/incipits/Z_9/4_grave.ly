\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Grave"
    R1
    c'2 h
    as' g
    r8 c, es fis g g as h
    c c, c' b as as, as' g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Grave"
    r8 c es fis g g, g'4~
    g8 g fis fis r g as h
    c as c d es es, es'4~
    es8 es16 f c8 h16 c d2
    g,8 g'4 g8 g f16 e f8 es
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Grave"
    r2 r8 g as h
    c c, es' d16 c g'8 d g4~
    g f es8 g4 es8
    c es4 d16 c h8 h c d
    c1
  }
}

Cello = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Grave"
    c2 h
    as' g
    r8 f as h c c, c' b
    as2 g
    e f
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
