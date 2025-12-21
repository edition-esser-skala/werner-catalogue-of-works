\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 4/4 \tempoMarkup "Presto"
    R1*2
    g''2 fis8 d4 f8
    e c4 es8 d g, g' f
    es g f \hA es d e16 fis g4~
    g8 f f e16 d e4 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 4/4 \tempoMarkup "Presto"
    d'2 cis8 a4 c8
    h g4 b8 a d, d' c
    b a16 b c8 b16 c d4 h
    c a b8 c16 d es8 d
    c b a c b4. a16 g
    a8 d a b a a16 h c8 e,16 fis
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/4 \tempoMarkup "Presto"
    r8 g' b g a4 fis
    g e f8 g16 a b8 a
    g f es4 d r
    R1*3
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/4 \tempoMarkup "Presto"
    R1*5
    d'2 cis8 a4 c8
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
