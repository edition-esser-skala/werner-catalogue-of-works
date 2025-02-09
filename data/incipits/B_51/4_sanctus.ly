\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Largo"
    r4 r16 b'' b( a) a( g) g( f)
    f4 r16 g g( f) f( es) es( d)
    d4 r16 es es( d) d( c) c( b)
    b4 r r
    r8 e, e16( f) f( g) g( a) a( b)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Largo"
    r4 r16 f' g( f) f( es) es( d)
    d4 r16 es es( d) d( c) c( b)
    b4 r16 g g( f) f( es) es( d)
    d4 r r
    r8 c' c,16( d) d( e) e( f) f( g)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    d'4^\tutti d,8 r r4
    d' d,8 r r4
    d' d,8 r r4
    d'4. d8 c c
    c4 r r
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus,
  san -- ctus Do -- mi --
  nus,
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    f4^\tutti f8 r r4
    f f8 r r4
    f f8 r r4
    g4. d8 g f
    e4 r r
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus,
  san -- ctus Do -- mi --
  nus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    b4^\tutti b8 r r4
    b b8 r r4
    b b8 r r4
    b4. b8 b a
    g4 r r
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus,
  san -- ctus Do -- mi --
  nus,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    b'4^\tutti b,8 r r4
    b' b,8 r r4
    b' b,8 r r4
    g'4. g8 e f
    c4 r r
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus,
  san -- ctus Do -- mi --
  nus,
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Largo"
    b'4-\tutti b,8 r r4
    b' b,8 r r4
    b' b,8 r r4
    g'4. g8 e f
    c4 r r
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r2 <6 5>4
  r2.
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
