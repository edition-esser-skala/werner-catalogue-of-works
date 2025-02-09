\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    r4 g'8( c) r4 c8( e) r4 e8( g)
    r4 g,8( b) r4 b8( e) r4 e8( g)
    r4 a,8( c) r4 c8( f) r4 f8( a)
    r4 g,8( c) r4 c8( e) r4 e8( g)
    r4 f,8( a) r4 a8( c) r4 c8( f)
    r4 c8( es) r4 es8( a) r4 a8( c)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    c8( e) r4 e8( g) r4 g8( c) r4
    c,8( e) r4 e8( g) r4 g8( b) r4
    c,8( f) r4 f8( a) r4 a8( c) r4
    c,8( e) r4 e8( g) r4 g8( c) r4
    a,8( c) r4 c8( f) r4 f8( a) r4
    f8( a) r4 a8( c) r4 c8( es) r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c'1.~^\tutti
    c~
    c~
    c~
    c~
    c~
  }
}

SopranoLyrics = \lyricmode {
  \set ignoreMelismata = ##t
  San --
  _
  _
  _
  _
  \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 e^\tutti e
    e1.
    f
    g
    a
    g
  }
}

AltoLyrics = \lyricmode {
  \set ignoreMelismata = ##t
  San -- ctus,
  san --
  _
  _
  _
  \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1.
    g^\tutti
    a
    g2 c1~
    c2 a f
    g1.
  }
}

TenoreLyrics = \lyricmode {
  San --
  _
  ctus, san --
  _ ctus,
  "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c'1.^\tutti
    b
    a
    e
    f
    es
  }
}

BassoLyrics = \lyricmode {
  \set ignoreMelismata = ##t
  San --
  _
  _
  _
  _
  \hy
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    c4-\tutti r c'-! r c-! r
    b r b-! r b-! r
    a r a-! r a-! r
    e r e r e r
    f r f r f r
    es r es r es r
  }
}

BassFigures = \figuremode {
  r1.
  <4 2>
  <6>
  q
  r
  <4>
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
