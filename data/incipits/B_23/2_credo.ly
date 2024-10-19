\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    c'1
    h2 g
    a h
    c e
  }
}

SopranoLyrics = \lyricmode {
  Pa --
  trem o --
  mni -- po --
  ten -- tem,
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    g'1
    f2 d
    e c'
  }
}

AltoLyrics = \lyricmode {
  Pa --
  trem o --
  mni -- "po -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 c
    h g
    a h
    g4 e' d c
    d1~
    d
    g,
  }
}

TenoreLyrics = \lyricmode {
  Pa --
  trem o --
  mni -- po --
  ten -- _ _ _
  _

  tem,
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c1
    d2 e
    f d
    e a
    g1
    d
    c
  }
}

BassoLyrics = \lyricmode {
  Pa --
  trem o --
  mni -- po --
  ten --
  tem, fa --
  cto --
  rem,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    << {
      r2 c'
      h g
      a h
    } \\ {
      c,1
      d2 e
      f d
    } >>
    e a
    g1
    d
    c
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <6 3>
  r
  <5>2 <6>
  r1
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
