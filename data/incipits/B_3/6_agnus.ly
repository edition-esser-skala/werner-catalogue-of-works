\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Largo"
    r4 g'' g d d h
    r h' h g g d
    r d' d h h g
    r a a fis fis dis
    r e e h h g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Largo"
    r4 d' d h h g
    r g' g d d h
    r h' h g g d
    r fis fis dis dis fis
    r h, h g g e
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Largo"
    r2 h^\solo d
    d4 g, g2 r4 d'
    d g, g2 r4 h
    dis1 dis2
    \appoggiatura { e8[ dis] } e2 e, r
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- _ i, qui
  tol -- _ lis pec --
  ca -- ta
  mun -- di:
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Largo"
    g'1-\solo r2
    g1 r2
    g1 r2
    fis1 r2
    e1 r2
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  <6\\>
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
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
