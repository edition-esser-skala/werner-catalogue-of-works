\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    r4 a'\f a
    r f'\p f
    r b\f b
    r es,\p es
    r g,\f g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Largo" f4\f r r
    a\p r r
    d\f r r
    b\p r r
    cis\f r r
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    a4\f r r
    f'\p r r
    b\f r r
    es,\p r r
    g\f r r
  }
}

Cello = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    d4\f r r
    d'\p r r
    g,\f r r
    g\p r r
    e!\f r r
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
