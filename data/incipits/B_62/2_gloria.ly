\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1
    r16 g'' fis g fis8 a h16 d, e d d8 e
    c h h a16 g g8 h a d,
    h' a16 h c8 h16 a h g fis e d c h a
    g4 r r2
    \clef soprano h'4 cis d8. d16 d4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    r2 r16 d' c d h8 d
    e4 d d r8 g,
    g16 fis g8 g fis g h a d,
    h' a16 h c8 h16 a h g fis e d c h a
    g4 r r2
    \clef soprano h'4 cis d8. d16 d4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 h'4^\tutti a
    h8 a16 h c8 h16[ a] h4 r
    R1
    h4 cis d8. d16 d4
  }
}

SopranoLyrics = \lyricmode {
  Et in %3
  ter -- ra, in ter -- ra pax,

  pax ho -- mi -- ni -- bus,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 g'4^\tutti fis
    g a8[ g16 fis] g4 r
    r2 e4 fis
    g4. fis16[ e] fis8. fis16 fis4
  }
}

AltoLyrics = \lyricmode {
  Et in %3
  ter -- ra pax,
  pax ho --
  mi -- _ _ ni -- bus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 d4^\tutti d
    d e8[ d] d4 r
    h8 c d2 c8 h16[ a]
    g4 r a a
  }
}

TenoreLyrics = \lyricmode {
  Et in %3
  ter -- ra pax,
  et in ter -- _ ra
  pax, pax "ho -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    g'4^\tutti d h g8 h
    c4 a g r
    r2 g4 d'
    g c,8[ d] g,4 r
    g'8 a h g c[ h a] d,
    g8. fis16 e8 a d,4 d8[ c]
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra pax,
  et in
  ter -- ra pax,
  et in ter -- ra pax __ ho --
  mi -- ni -- bus, in ter -- ra
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'2-\solo g,
    c4 d g,8 g'16 a h8 c
    a g d4 g,-\tutti d'
    g c,8 d g,4 r
    g'8 a h g c h a d,
    g, g'16 fis e8 a d,4 d8 c
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <6 4>8 <5 3> r2
  r4 <6>2.
  r2 <9>4 <6>
  r <6\\>2.
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
