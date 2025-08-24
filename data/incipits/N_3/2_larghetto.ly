\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Larghetto"
    h''8( c) h( a) g( fis)
    g2 r4
    fis,8(\p g) a4 g
    g8( fis) fis4 r
    g\f g8 a h4
    c c8 d e4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Larghetto"
    g''8( a) g( fis) e( dis)
    e2 r4
    dis,8 e fis4 e
    e8( dis) dis4 r
    e e8( fis) g4
    e c a
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/4 \tempoMarkup "Larghetto"
    R2.
    e,8( dis) e( fis) g( a)
    h2 cis4
    h2 r4
    R2.
    r4 e e
  }
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Larghetto"
    e2 r4
    e8( dis) e( fis) g( a)
    h2 ais4
    h2 r4
    R2.
    a!4 a8 h c4
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
