\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4 d8.\trill c32 d e16 f e f g8 g,
    c16 d c d e8 e, a16 h a h c8 c,
    f16 g a8 g f e16 c g' e c' g e' c
    \kneeBeam g' g,, h g d' h g' d e c g' e c'\p g e' c
    g' g, h g d' h g' d e g e g c, e g, c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4 d8.\trill c32 d e16 f e f g8 g,
    c16 d c d e8 e, a16 h a h c8 c,
    f16 g a8 g f e16 c g' e c' g e' c
    \kneeBeam g' g,, h g d' h g' d e c g' e c'\p g e' c
    g' g, h g d' h g' d e8 c g e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'4^\tutti d8.([\trill c32 d)] e16([ f e f] g8) g,
    c16[ d c d] e8 e, a16([ h a h)] c8 c,
    f16[ g a8] g f e c r c'
    d h r d e e r c\p
    d h r d c c r \mvTr g\f^\solo
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e __ e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'4.^\tutti g8 g4 r8 d
    e e r g c, c r c
    d[ e16 f] g4 g r8 g
    g g r g g g r g\p
    g g r g g g r \mvTr e\f^\solo
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    e4^\tutti d c r8 d
    c c r h a a r g
    a16[ h c8] d16[ c d8] g,4 r8 e'
    d d r d c c r e\p
    d d r d e e r4
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'8. c16 h8 g c c, r h'
    a a, r g' f f, r e'
    d[ c] h4 c r8 c'
    h g r h c c, r c\p
    h g r h c c r4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8-\tutti e h g c c, r h'
    a a, r g' f f, r e'
    d c h4 c r8 c'
    h g r h c c, r \mvTr c\p-\tasto
    h g r h c c, r4
  }
}

BassFigures = \figuremode {
  %tacet
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
