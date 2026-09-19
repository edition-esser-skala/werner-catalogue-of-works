\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    fis4 r8 ais\p h ais
    h4 r8 cis, d cis
    d8. e16 fis8 gis16 ais h8 cis
    d cis16 d h8 d cis16 d e8
    a,2~ a16 d, d'8
    d2.\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    d4 r8 cis\p d cis
    d4 r8 ais h ais
    h8. h16 cis8 cis d e
    fis e16 fis d8 fis16 g a!8 e
    fis4 e d
    g a h
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 \mvTr fis^\solo fis
    fis2.
    fis4. g8 fis[ e]
    d[ cis16 d] h4 r8 cis
    d[ cis16 d] e8[ d16 e] fis8[ e16 fis]
    g8[ fis16 g] a8[ g16 a] h8. h16
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di --
  ctus, __ _ qui
  ve -- nit in
  no -- _ _
  _ _ _ "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    h8-\solo h'16 ais h8 fis d fis
    h, h'16 ais h8 fis d fis
    h a16 g fis8 e d cis
    h4 r8 h' a g
    fis4 cis d
    h fis g
  }
}

BassFigures = \figuremode {
  r4. <_+>8 <6> <_+>
  r4. <_+>8 <6> <_+>
  r4 <_+>8 <_!> <6> <6\\>
  r2 r8 <6>
  q4 r2
  <6>4 q2
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
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
