\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
    d'2.~
    d4 cis8 h \hA cis a
    b2.~
    b4 a8 g a f
    g2.~
    g4 f8 e f d
    e4 d cis
    d f'8 e f d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
    f8 g a4 b
    e, a2
    a4 g2
    g4 f8 d f e
    d4 cis d
    e d8 cis d4
    b2 a4
    f' d d'
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
    a'4 f e
    a,2 e'4
    f e2
    e4 d2
    f4 e e
    cis a2
    d cis4
    a2 a4
  }
}

Cello = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
    d8 e f4 g
    a2 a4
    d, g e
    cis d2
    b4 e cis
    a d2
    g, a4
    d2 d'4
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
    d8 e f4 g
    a2 a4
    d, g e
    cis d2
    b4 e cis
    a d2
    g, a4
    d2 d'4
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
        \set Staff.instrumentName = \markup \center-column { "vlc" "solo" }
        \Cello
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
