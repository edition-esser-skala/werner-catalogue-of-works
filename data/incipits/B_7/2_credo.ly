\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    g'1 a
    h2 c c h
    c4 d e d8[ e] f2 f
    e e d2. c8[ h]
    a2 h a1
    h2 d2. h4 e2
  }
}

SopranoLyrics = \lyricmode {
  Pa -- _
  trem o -- mni -- po --
  ten -- _ _ _ tem, fa --
  cto -- rem coe -- _
  li et ter --
  rae, et in "u -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1 d
    e2 g g fis
    g e a g~
    g4 f! g2 a1
    g2 g g1
    fis2 g1 fis2
    g r g2. e4
  }
}

AltoLyrics = \lyricmode {
  Pa -- _
  trem o -- mni -- po --
  ten -- tem, fa -- cto --
  _ rem coe --
  li et ter --
  rae, ter -- _
  rae, et in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r2 c c h
    c4 d e d c2 d~
    d c d d
    c1 c2 c
    c1 h4 c d2~
    d d d1
    d r
  }
}

TenoreLyrics = \lyricmode {
  O -- mni -- po --
  ten -- _ tem, _ cre -- do __
  fa -- cto -- rem
  coe -- li et
  ter -- _ _ rae, __
  et ter --
  rae,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r2 a' f g4 f
    e d c h a2 d
    g, r f'! g4 f
    e d c h a2. h4
    c1 g4 a h c
    d2 g d2. d4
    g,1 r
  }
}

BassoLyrics = \lyricmode {
  Fa -- cto -- rem _
  coe -- _ li __ _ et ter --
  rae, vi -- si -- _
  bi -- _ li -- um o -- mni --
  um et __ _ in -- _
  vi -- si -- bi -- li --
  um,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c2 a' f g4 f
    e d c h a2 d
    << { g } \\ { g, } >> a'4 g f!2 g4 f
    e d c h a f a h
    c d e f << { g } \\ { g, } >> a h c
    d2 g d1
    g,2 \clef soprano << { d'''2. h4 e2 } \\ { r2 g,2. e4 } >>
  }
}

BassFigures = \figuremode {
  r1 <6 5>
  r <7>2 <_+>
  r1 <6 5>
  r <6>
  r\breve
  <_+>1 <4>2 <_+>
  r\breve
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
