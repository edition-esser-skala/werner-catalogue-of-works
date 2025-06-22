\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]"
    R1.
    e'2-\tutti g d
    e e,-\solo d
    c r4 e' c' e,
    e( d) r d h' d,
    d( c) r c a' c,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]"
    R1.
    c'1-\tutti h2
    c c,-\solo h
    c r4 c' g c
    c( h) r h d h
    h( a) r a d, a'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]" \autoBeamOff
    R1.
    e'2 g d
    e e r
    R1.*3
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]" \autoBeamOff
    c2^\solo e g
    c^\tutti c h
    c2.^\solo h8[ a] g[ a g f]
    e[ f e d] c[ h c d] e[ d e f]
    g[ f g a] g[ a h a] g[ a h g]
    a[ g a h] a[ h a g] fis[ e \hA fis d]
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- _ _
  _ _ _
  _ _ _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]" \autoBeamOff
    R1.
    c2 c d
    g, g r
    R1.*3
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]" \autoBeamOff
    R1.
    c2 e g
    e c r
    R1.*3
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[Larghetto / Allegretto]"
    c1-\solo r2
    c-\tutti e g
    e c r
    R1.*3
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r1.*3
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
