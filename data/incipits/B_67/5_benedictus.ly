\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \phrygian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.*3
    r4 e'^\solo e,
    a h c
    c h8[ c] a4
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- %4
  di -- ctus, qui
  ve -- nit, qui
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \phrygian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 e^\solo e,
    a h c
    c h8[ c] a4
    a8[ gis] gis4 r
    R2.
    r4 r f'
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit,

  qui
}

Organo = {
  \relative c {
    \clef bass
    \key a \phrygian \time 3/4 \tempoMarkup "[no tempo]"
    a'2-\solo g4
    f2 e4
    d2.
    e2 d4
    c h a
    d2.
  }
}

BassFigures = \figuremode {
  r2.
  <3>4 <4!> <6>
  <7> <6!> <5>
  r2.
  <6>
  <7>4 <6!> <5>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

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
