\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    R1*3
    d'4. d8 es es es es
    fis,2 g8 g d'4~
    d8 b g4. b8 a g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    R1*4
    r2 g'4. g8
    b b b b cis,2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    d'4.^\tutti d8 es es es es
    fis,2 g8 g d'4~
    d8 b g4. b8 a g
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e -- lei --
  son, Ky -- ri -- e "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    r2 g'4.^\tutti g8
    b b b b cis,2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei -- son, "Chri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d4.^\tutti d8 es es es es
    fis,2 g8 g d'4~
    d8 b g4. b8 a g
    f! d b'4. g8 c b
    a2 d,4 r
    R1
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e -- lei --
  son, Ky -- ri -- e e --
  lei -- son, Ky -- ri -- e e --
  lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 g'4.^\tutti g8
    b b b b cis,2
    d8 d g4. es!8 c4~
    c8 es d c b g r g'~
    g g g g a4 a,
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- %2
  e e -- lei -- son, Chri --
  ste e -- lei -- _ son, __
  Chri -- ste e -- lei -- son, Ky --
  ri -- e e -- lei -- son,
}

Organo = {
  \relative c {
    \clef tenor
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    d'4.-!-\tutti d8-! es-! es-! es-! es-!
    fis,2-!\trill \clef bass << { s4 d' } \\ { g,4.^! g8 } >>
    b b b b cis,2
    d4 g4. es8 c4~
    c8 es d c b g r g
    g'4. g8 a4 a,
  }
}

BassFigures = \figuremode {
  r1
  r
  <3>4 <6> <5> <6>8 <5>
  <_!>4 <5> <6>2
  <4\+ 2>4. \once \bassFigureExtendersOn q8 r2
  r <_+>
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
