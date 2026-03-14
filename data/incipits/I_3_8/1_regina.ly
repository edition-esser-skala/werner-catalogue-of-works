\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 2/2 \tempoMarkup "[no tempo]"
    c'1
    f2 c
    d1
    c
    r2 f,
    c' g
    a1
    g2 r4 g
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key f \major \time 2/2 \tempoMarkup "[no tempo]"
    R1*2
    r4 b' f b
    b a8 g a4 g
    f1~
    f2 e
    r4 f c f
    f2 e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c'1
    f2 c
    d1
    c
    r2 f,
    c' g
    a1
    g2 r4 g
  }
}

SopranoLyrics = \lyricmode {
  Re --
  gi -- na
  coe --
  li,
  re --
  gi -- na
  coe --
  li, "lae -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r4 b' f b
    b a8[ g] a4 g
    f1~
    f2 e
    r4 f c f
    f2 e
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- _ li, lae --
  ta --
  re,
  Re -- gi -- na
  coe -- li,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r4 f, b b
    c2 c4 c
    a h8[ c] d2
    g,4 g c2~
    c c4 c
    c2 c
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- _ _
  re, lae -- ta --
  re, Re -- gi --
  na, Re -- "gi -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r4 b d b
    f'2 f4 e
    d1
    c
    r4 f a f
    c'2 c,
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta --
  re,
  Re -- gi -- na
  coe -- li,
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 2/2 \tempoMarkup "[no tempo]"
    c''1-!
    f2-! c-!
    d4-! \clef bass b,, d b
    f'2. e4
    d1
    c
    r4 f a f
    c'2 c,
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <4>2 <3>
  <7> <6!>
  <4> <3>
  r1
  <4>2 <3>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
