\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "Largo"
    \partial 2 h'2 e,1 fis2
    g1 a2
    g( e) fis
    e1 e'2
    d!1 cis2
    d( fis) e
    d( h) cis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "Largo"
    \partial 2 h'2 e,1 dis2
    e1 fis2
    e1 dis2
    e1 g2
    fis1 fis2
    fis( d'!) cis
    h1 ais2
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \tempoMarkup "Largo"
    \partial 2 r2
      r r h
    h1 fis'2
    h,1 h2
    h1 e,2
    h'1 ais2
    h1 cis2
    d1 fis2
  }
}

Cembalo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "Largo"
    \partial 2 r2 r r h'
    e,1 dis2
    e1 h2
    e,1 r2
    r r fis'
    h,1 ais2
    h1 fis'2
  }
}

BassFigures = \figuremode {
  r2 r1 <_+>2
  r1 <5>2
  r1 <_+>2
  r1.
  r1 <_+>2
  r1 <5>2
  r1 <_+>2
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
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
