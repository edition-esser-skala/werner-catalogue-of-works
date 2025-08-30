\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 c'
    h2 g a h
    c e d1
    c2 c h1
  }
}

SopranoLyrics = \lyricmode {
  Pa --
  trem o -- mni -- po --
  ten -- tem, fa --
  cto -- rem "coe -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    g'1 f2 d
    e c'1 h2~
    h a1 gis2
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem, "fa -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r2 c h g
    a h g4 e' d c
    d\breve
    g,1 r2 e'
    e f1 e2~
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- _ _ _
  _
  tem, fa --
  cto -- rem "coe -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 d2 e
    f d e a
    g g d1
    c r2 gis'
    a f d e
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- _
  tem, fa -- cto --
  rem, fa --
  cto -- rem coe \hy
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      r2 c' h g
      a h
    } \\ {
      c,1 d2 e
      f d
    } >> e a
    g1 d
    c g'2 gis
    a f d e
  }
}

BassFigures = \figuremode {
  r\breve
  r1 <6 3>
  r <5>2 <6>
  r1 <5 4>2 <\t 3>
  r1 <6 5>2 <_+>
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
