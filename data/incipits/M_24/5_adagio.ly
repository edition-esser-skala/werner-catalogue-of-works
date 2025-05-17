\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    R1
    r4 d'2 c!4
    b2\trill a4 a'~
    a g8 f e4 c'~
    c b8 a gis4 a~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    r4 a'2 g4
    f2\trill e4 a~
    a g2 f4
    r b'2 a8 g
    fis4 d'2 c4~
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    r2 r4 e~
    e d e4. e8
    f4 g c,4. c8
    d4. d8 g,4 e'
    a, fis' h, a
  }
}

Cello = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    d2 cis
    d a4 a'
    d, e f2
    b, c
    d e4 f
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
