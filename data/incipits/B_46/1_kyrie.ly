\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegretto o vivace"
    c'8.\f c,16 c d32 e f g a h c8. c,16 c c' h( c)
    h( c) a( h) g f' e( f) e( f) d( e) c c, h( c)
    h( c) a( h) g f' e( f) e( f) d( e) c32 g a h c16 d \gotoBar "12"
    c4 r r16 c'\f h( c) h( c) a( h)
    g8 e r4 r16 c' a( c) g( c) f,( c')
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegretto o vivace"
    c'8.\f c,16 c d32 e f g a h c8. c,16 c c' h( c)
    h( c) a( h) g f' e( f) e( f) d( e) c c, h( c)
    h( c) a( h) g f' e( f) e( f) d( e) c8 \tuplet 3/2 8 { g16 a h } \gotoBar "12"
    c4 r r16 c'\f h( c) h( c) a( h)
    g8 e r4 r16 c' a( c) g( c) f,( c')
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto o vivace"
    R1*3 \gotoBar "12"
    c'8.^\tutti c16 d8 g e c r4
    c8. c16 d8 h c c r4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto o vivace"
    R1*3 \gotoBar "12"
    g'8. g16 g8 g g e r4
    g8 e d g e c r4
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto o vivace"
    R1*3 \gotoBar "12"
    e8^\tutti c g d' c c r4
    g8. g16 g8 d' c a r4
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto o vivace"
    R1*3 \gotoBar "12"
    c8^\tutti e h g c c r4
    e8 c' h g c c, r4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegretto o vivace"
    c'8.-\solo c,16 c8. \tuplet 3/2 16 { g'32( a h) } c8. c,16 c8 c'
    h a g f e d c c'
    h a g f e d c r \gotoBar "12"
    c-\tutti e h g c a' g f
    e c h g c f e d
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
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
