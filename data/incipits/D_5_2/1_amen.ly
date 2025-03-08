\version "2.24.2"
\include "header.ly"

ViolinoIeII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4
    c4 r8 c'16 h c8 g
    a16 h c8 f, d'16 c d8 a
    h16 c d8 g, e'16 d e8 h
    c16 d e8 a, c a' c,
    h g' a, g' d, fis'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff
    r4 g'2
    a8[ g] a2
    h8[ a] h2
    c8[ h] c2
    h4 a2
  }
}

SopranoLyrics = \lyricmode {
  A --
  _ _
  _ _
  _ _
  men, "a -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff
    R2.*5
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff
    R2.*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff
    R2.*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4
    c8 d e4 c
    f, f' d
    g, g' e
    a, a' fis
    g c, d
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r2 <6 5>4
  r q <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoIeII
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoIeII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
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
