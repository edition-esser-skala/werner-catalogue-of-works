\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key a \major \time 2/2 \tempoMarkup "Allegro"
    a''4 a2 h8 cis
    h4 dis, e4. fis16 gis
    a4 fis cis dis
    e h e,2
    r4 fis' gis( a)
    e gis, a2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key a \major \time 2/2 \tempoMarkup "Allegro"
    cis'4 cis8 d e( d) e4
    e, h'8 a gis fis e4
    r a a' a,~
    a gis r2
    fis'4 d2 cis8 d
    e4 gis, a2
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twotwotime \key a \major \time 2/2 \tempoMarkup "Allegro"
    a'4 e cis a
    gis'2 r
    fis r
    e4 e' gis, e
    d2 r
    cis r
  }
}

BassFigures = \figuremode {
  r2 <6>
  q1
  r
  <4>4 <3> <6>2
  r1
  <6>
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
