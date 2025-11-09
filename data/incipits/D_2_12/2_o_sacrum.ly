\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 4/4 \tempoMarkup "Adagio"
    b''2 r
    a r
    g g4 g8 g
    g4. g8 fis2
    f r
    c'4 f,2 es4
    d2 e4 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 4/4 \tempoMarkup "Adagio"
    d'2 r
    es r
    d es4 c8 c
    cis4. cis8 d2
    d r
    f, h4 c~
    c b2 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'2 r
    es r
    d g4 c,8 c
    cis4. cis8 d2
    f! r
    f,! h4 c8 c
    c4 b2 a4
  }
}

SopranoLyrics = \lyricmode {
  O,
  o,
  o sa -- crum con --
  vi -- vi -- um,
  o,
  o sa -- crum con --
  vi -- _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    b'2 r
    a r
    r4 g g g8 g
    g4. g8 fis2
    d r
    r4 f!2 es4
    d d e f
  }
}

AltoLyrics = \lyricmode {
  O,
  o,
  o sa -- crum con --
  vi -- vi -- um,
  o,
  o sa --
  crum con -- vi \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d2 r
    c r
    h c4 c8 c
    e!4. e8 a,2
    b r
    c d4 g,8 g
    g4. g8 g4 a8[ b]
  }
}

TenoreLyrics = \lyricmode {
  O,
  o,
  o sa -- crum con --
  vi -- vi -- um,
  o,
  o sa -- crum con --
  vi -- vi -- um, "con -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    g'2 r
    fis r
    f es4 es8 es
    e4. e8 d2
    b r
    a' g~
    g c,
  }
}

BassoLyrics = \lyricmode {
  O,
  o,
  o sa -- crum con --
  vi -- vi -- um,
  o,
  o sa --
  crum
}

Organo = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/4 \tempoMarkup "Adagio"
    g'2 r
    fis r
    f es
    e4. e8 d2
    b r
    a' g
    g c,
  }
}

BassFigures = \figuremode {
  r1
  <7- 5>
  <4! 2>2 <6>
  <6\\> <_+>
  r1
  <6>2 <7 _!>4 <6- 4>
  <5 \t> <\t _-> <7 _!> <6 4>
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
