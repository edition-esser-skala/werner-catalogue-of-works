\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Vivace"
    \partial 4 g'4 c2 g'
    e c
    d h
    c r4 e
    d2 c
    h4 c d e
    h2 a
    g r4 g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Vivace"
    \partial 4 g'4 c2 g'
    e c
    d h
    c r4 e
    d2 c
    h4 c d e
    h2 a
    g r4 g
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Vivace"
    \partial 4 r4 r g' g g
    g2 g4 e
    a2 g
    g r
    r4 g g a
    g2 g
    g fis
    g r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/2 \tempoMarkup "Vivace" \autoBeamOff
    \partial 4 g'4^\tutti c2 g'
    e c
    d h
    c r4 e
    d2 c
    h4 c d e
    h2 a
    g r4 g
  }
}

SopranoLyrics = \lyricmode {
  Ehr ſey Gott
  in den
  höch -- ſten
  Thron, wie
  auch ſein
  ein -- _ ge -- _
  bohr -- nen
  Sohn, Frid
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/2 \tempoMarkup "Vivace" \autoBeamOff
    \partial 4 r4 r g'^\tutti g g
    g2 g4 e
    a2 g
    g r
    r4 g g a
    g2 g
    g fis
    g r
  }
}

AltoLyrics = \lyricmode {
  Ehr ſey -- e
  Gott in den
  höch -- ſten
  Thron,
  wie auch ſein
  ein -- ge --
  bohr -- nen
  Sohn,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/2 \tempoMarkup "Vivace" \autoBeamOff
    \partial 4 r4 r e^\tutti d h
    c e2 c4
    a f' d2
    e r
    r4 h e d
    d e d g,
    d'2 d
    d r
  }
}

TenoreLyrics = \lyricmode {
  Ehr ſey -- e
  Gott in den
  höch -- _ ſten
  Thron,
  wie auch ſein
  ein -- _ ge -- _
  bohr -- nen
  Sohn,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Vivace" \autoBeamOff
    \partial 4 r4 r c'^\tutti h g
    c2 e,4 a
    f d g2
    c, r
    r4 g' e fis
    g e h c
    d c d2
    g, r
  }
}

BassoLyrics = \lyricmode {
  Ehr ſey -- e
  Gott in den
  höch -- _ ſten
  Thron,
  wie auch ſein
  ein -- _ ge -- _
  bohr -- _ nen
  Sohn,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Vivace"
    \partial 4 r4 r c'-\tutti h g
    c c, e a
    f d g f
    e d c c'
    h g e fis
    g e h c
    d c d d,
    g d' g f!
  }
}

BassFigures = \figuremode {
  r4 r1
  r
  <6>
  r
  r2 <6>
  r4 <6>2.
  <6 4>2 <5 _+>
  r1
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
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
