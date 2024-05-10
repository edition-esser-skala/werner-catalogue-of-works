\version "2.24.2"
\include "header.ly"

pstac = \markup { \larger \bold "p" \remark "e staccato" }

Chalumeau = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    r2 \afterGrace { d'1^\markup \remark "Ariose" } { e8( fis) }
    g1 \afterGrace g2 { a8( b) }
    fis2 fis2.\trill g4
    g1 r2
    r d b'4( d,)
  }
}

ViolinoIeII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    r4 g-\pstac b d g b
    r g b d g b
    r a, c fis a c
    r g,, b d g b
    r g b d g b
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/2 \tempoMarkup "Largo" \autoBeamOff
    R1.*3
    r2 d^\solo ^\markup \remark "Ariose" d4 e8([ fis)]
    g1 \afterGrace g2( { a8[ b]) }
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve Re --
  gi -- na, __
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    g2-\pstac-\solo g g
    g g g
    g g g
    g g g
    g g g
  }
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "chalumeau"
      \Chalumeau
    }
    \new StaffGroup \with { \smallGroupDistance } <<
      \new Staff {
        \set Staff.instrumentName = "vl 1, 2"
        \ViolinoIeII
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
