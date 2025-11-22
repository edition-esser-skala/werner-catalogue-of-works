\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Allegro assai"
    e'4\p e, r
    f' f, r
    gis' gis, r
    a' a, r
    g'! g,! r
    f' f, r
    gis gis, r
    a' a, r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "Allegro assai"
    c'4\p c, r
    d' d, r
    h' h, r
    c' c, r
    cis' cis r
    d d, r
    h' h, r
    c'! c, r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Allegro assai"
    r4 a'\p a,
    r a' a,
    r a' a,
    r a' a,
    r a' a,
    r a' a,
    r a' a,
    r a' a,
  }
}

BassFigures = \figuremode {
  r2.
  r4 <6 4>2.
  <7\\ 2>
  <8 3>
  <7! _+>
  <6 4>
  <7\\ 2>
  <_!>
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
