\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Presto"
    R1*2
    d4 d'4. c8 h a
    h4 e2 d4
    e r e, e'~
    e8 d c h c4 cis
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Presto"
    R1*2
    d4 d'4. c8 h a
    h4 e2 d4
    e r e, e'~
    e8 d c h c4 cis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1*2
    d4^\tutti d'4. c8[ h a]
    h4 e2 d4
    e r e, e'~
    e8[ d c h] c4 cis
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ _
  ctus, san -- _
  _ ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1
    a4^\tutti a'4. g8[ f e]
    f2 e4 e8[ f]
    g[ f16 e] d8[ c] f2
    e r
    a,4 a'~ a8[ g f e]
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  _ ctus, san --
  _ _ _
  ctus,
  san -- \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    r2 e,4^\tutti e'~
    e8[ d c h] c2~
    c4 h c2
    r d,4 d'~
    d8[ c h a] h4 c~
    c d e2
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  _
  _ ctus,
  san -- _
  _ _
  _ ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    a4^\tutti a'4. g8[ f e]
    f2 e
    d a
    R1
    a4 a'4. g8[ f e]
    f2 e
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ ctus,
  san -- ctus,

  san -- _ _
  _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Presto"
    << { a4 a'~ a8 g e'4 } \\ { s2-\tutti e,4 f8 e } >>
    f2 e
    d a
    r \clef tenor d4 d'
    \clef bass a, a'4. g8 f e
    f2 e
  }
}

BassFigures = \figuremode {
  r1
  <7 3>4 <6> <6 4> <\t 3>
  <7> <6> <4> <_!>
  r2 <9 3>4 <8>
  <4> <3> <5 2> r
  <7> <6> <6 4> <6\\ _!>
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
