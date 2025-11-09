\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c'8 c, r e'16 d c h a g
    f8 d r f'16 e d c h a
    g8 e r g'16 f e d c h
    a8 f r a'16 g f e d c
    h8 g r h'16 a g f e d
    c8 a r c'16 h a g f e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c'8 c,16 d e f g8 e c
    r d16 e f g a8 f d
    r e16 f g a h8 g e
    r f16 g a h c8 a f
    r g16 a h c d8 h g
    r a16 h c d e8 c a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.*6
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.*4
    d2^\tutti h'4
    c,2 f4
  }
}

AltoLyrics = \lyricmode {
  Et in
  ter -- ra
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.*2
    g2^\tutti g'4
    a,2 d4
    h g' h,
    h8[ a] c2
  }
}

TenoreLyrics = \lyricmode {
  Et in
  ter -- ra
  pax, et in
  ter -- ra,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c2^\tutti c'4
    d,2 h'4
    e, e2
    f4 f2
    g4 g2
    a4 a,2
  }
}

BassoLyrics = \lyricmode {
  Et in
  ter -- ra
  pax, in
  ter -- ra
  pax, in
  ter -- ra,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8-\tutti c c c c c
    d d d d d d
    e e e e e e
    f f f f f f
    g g g g g g
    a a a a a a
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2 q4
  r2 q4
  r2 q4
  r2 q4
  r2 q4
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
