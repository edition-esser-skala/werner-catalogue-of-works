\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Vivace"
    R2.*2
    d'16 d d d b' b b b e, e e e
    f c' a c f, a c, f a, c f, a
    b d g, b es,! es' c es a, c f, a
    d, d' b d g, b es, g c, c' a c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Vivace"
    R2.*2
    f16 f f f d' d d d g, g g g
    a a' f a c, f a, c f, a c a
    b d g, b es,! es' c es a, c f, a
    d, d' b d g, b es, g c, c' a c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    b'8^\solo f' d b f b
    d,4 r r
    b'8^\tutti d4 d8 e e
    f4 r f
    g, es'!8 es f,4
    d'8[ b g es c' a]
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, ter -- ra
  pax,
  pax, pax ho -- mi -- ni --
  bus bo --
  nae vo -- lun -- ta --
  \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    b'8 d b f d f
    b,4 r r
    f'8^\tutti f g4. g8
    c,4 r r
    b' c, a'8 a
    f d r4 f~
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra, ter -- ra
  pax,
  pax ho -- mi -- ni --
  bus
  bo -- nae vo -- lun --
  ta -- tis, "bo -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.
    b8^\solo f' d b f b
    d,4 b'8^\tutti b b b
    a4 r r
    R2.
    r4 es' f,
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra, ter -- ra
  pax, pax ho -- mi -- ni --
  bus

  bo -- nae
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.
    b'8^\solo d b f d f
    b,4 g'8^\tutti g g g
    f4 r r
    R2.
    b4 c, a'8 a
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, ter -- ra
  pax, pax ho -- mi -- ni --
  bus

  bo -- nae vo -- "lun -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Vivace"
    b4-\solo r r
    b r r
    b8-\tutti b g g g g
    f f f f f4
    \clef soprano << { g''4 es'!8 es f,4 } \\ { b4 c, a'8 a } >>
    \clef bass b,4 c, a'8 a
  }
}

BassFigures = \figuremode {
  r2.
  r
  r4 <5> <6!>
  r2.
  r
  r4 <_-> <6>
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
