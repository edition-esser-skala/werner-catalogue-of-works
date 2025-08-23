\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b''8\f f16. d32 b8 f d b r4
    r8 f''16. d32 b8 d g, g'16. es32 c8 es
    a, a'16. f32 d8 f b, g'16. b,32 c8 a'16. c,32
    d8 b16. d32 f8 a16. f32 b8 b,16. d32 f8 b16. f32
    g8 es,16. g32 b8 d16. b32 es8 g16. es32 c'8 d,
    c a16. c32 f8 f, r a16.\p c32 f8 f,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Andante"
    d'8\f d, r4 b''8 f16. d32 b8 f
    d b r b'4 g8 es c'~
    c a f d'~ d es4 f8~
    f b,16. d32 f8 a16. f32 b8 b,16. d32 f8 b16. f32
    g8 es,16. g32 b8 d16. b32 es8 g16. es32 c'8 d,
    c a16. c32 f8 f, r a16.\p c32 f8 f,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*3
    d'8.^\tutti d16 d8 f d d r d
    b b r d c c c b
    a4 r8 b c c r d\p
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- %4
  lei -- son, e -- lei -- son, Ky -- ri --
  e e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*3
    f8.^\tutti f16 f8 a g g r f
    es es r f es es es d
    c4 r8 d f f r f\p
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- %4
  lei -- son, e -- lei -- son, Ky -- ri --
  e e -- lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*3
    b8.^\tutti b16 b8 a b b r b
    g g r b g g f f
    f4 r8 f a a r b\p
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- %4
  lei -- son, e -- lei -- son, Ky -- ri --
  e e -- lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*3
    b'8.^\tutti b16 b8 f g g r d
    es es r b c c a b
    f'4 r8 b a f r b\p
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- %4
  lei -- son, e -- lei -- son, Ky -- ri --
  e e -- lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b'4.-\solo a8 b4. a8
    b4 r8 b,16. d32 es8 es, r c'16. es32
    f8 f, r d'16. f32 g8 es16. g32 a8 f16. a32
    b8-\tutti b, b' f g g r d
    es es r b c c a b
    f'4 r8 b a f r b\p
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <5>8 <8> <5> <8>
  r1
  r2. <6 5>4
  r1
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
