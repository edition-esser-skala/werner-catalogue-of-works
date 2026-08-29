\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    d'16 g fis g d g fis g a8 d,, d4
    r16 h'' a h g h a g d'8 d,, d4
    r16 g' fis g g, h d g e8 c, c4
    r16 a'' g a a, c e a fis8 d, d4
    r16 h' d g a d, fis a h8 h, a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r2 d16 a' g a d, a' g a
    h8 g, g4 r16 a' g a fis a g fis
    h8 g, g4 r16 g'' f g e g d g
    c,8 a, a4 r16 a'' g a fis a e a
    d,8 d, d4 r16 h' d g fis d a fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4.^\tutti d8 d4 d,
    r d' d d,
    r d' e, e
    r e' fis, fis
    r8 d' d d d8. d16 d4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra,
  in ter -- ra,
  in ter -- ra,
  in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    h'4^\tutti r8 h a[ g] a[ fis]
    g4 r8 h a[ g] a[ fis]
    g4 r r e
    e r r fis
    g a8 fis g8. g16 fis4
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax,
  pax, pax,
  pax, pax ho -- mi -- ni -- bus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r2 d4.^\tutti d8
    d4 d, r d'
    d d, r g
    c r r a
    d a8 d h8. h16 a4
  }
}

TenoreLyrics = \lyricmode {
  Et in
  ter -- ra, in
  ter -- ra pax,
  pax, pax,
  pax, pax ho -- mi -- ni -- bus,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti r8 g fis[ e] fis[ d]
    g4 r8 g fis[ e] fis[ d]
    g4 h c, c
    r c' d, d
    r8 g fis d g8. g16 d4
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, in ter -- ra,
  in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'8-\tutti a h g fis e fis d
    g a h g fis e fis d
    g a h g c d c h
    a h c a d e d c
    h g fis d g g, d' d'
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  <6>4 q2.
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
