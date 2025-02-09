\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r2 c'2. h4 g2
    a h c4 g c2~
    c h c1
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ ctus, san -- _ _
  _ ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 r2 f~
    f4 e c2 d e
    f4 c f1 e2
    d1 e4 e a a
  }
}

AltoLyrics = \lyricmode {
  San -- %2
  _ _ _ ctus,
  san -- _ _ _
  _ ctus, san -- _ ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 c~
    c4 h g2 a2. h4
    c1 r2 c~
    c4 a d2 g, r
    a g g c~
  }
}

TenoreLyrics = \lyricmode {
  San --
  _ _ _ _
  ctus, san --
  _ _ ctus,
  san -- _ ctus, "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1~ f4 e c2
    d e f4 e d2
    c a' g c,
    f d c a'
    f g c,1
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ ctus, san -- _ _
  ctus, san -- _ ctus,
  san -- _ _ ctus,
  san -- _ ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      s1 c'~
      c4 h g2 a s
    } \\ {
      f1~-! f4 e c2
      d e f4 e d2
    } >>
    c a g c
    f d c a'
    f g c,1
  }
}

BassFigures = \figuremode {
  r\breve
  r1. <5 3>4 <6!>
  <4> <3>2. <4>4 <_!>2.
  r2 <6!> <4> <5>
  <6 5> <_!> r r
}

\score {
  <<
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
