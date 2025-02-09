\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto"
    c'4\p a'4. g8 f4~
    f e f4.\trill e16 d
    c4 f, r2
    R1
    r8 g16 a b8 c d e f g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto"
    c'4\p a'4. g8 f4~
    f e f4.\trill e16 d
    c4 f, r2
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Presto"
    f2.^\solo f4
    g2 f4 b
    b a g2
    f r
    r f
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- _ _
  nit,
  qui
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Presto"
    f2.^\solo f4
    g2 f4 b
    b a g2
    f r
    r f
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- _ _
  nit,
  qui
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Presto"
    R1*2
    r4 c2^\solo c4
    d2 c4 f
    f e d2
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Presto"
    R1
    r2 d^\solo
    e4 f2 e4
    f b2 a4
    g2 f
  }
}

BassoLyrics = \lyricmode {
  Be --
  ne -- di -- ctus,
  qui ve -- _
  _ nit,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Presto"
    f,4-\solo f' d a
    b c d2
    e4 f2 e4
    d8 b d e f4 f,
    c' g8 a b c d e
  }
}

BassFigures = \figuremode {
  r2. <6>4
  <6 5>2 <5>4 <6>
  <6 5>2 <5 2>4 <\t \t>
  <6>2 <4>4 <3>
  <4> <6>2.
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
