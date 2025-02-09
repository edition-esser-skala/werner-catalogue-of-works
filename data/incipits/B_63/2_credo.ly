\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1 d
    c2 a d d
    d cis d d
    h g c2. h4
    a2 c h a
    a gis a1
  }
}

SopranoLyrics = \lyricmode {
  Pa -- _
  trem o -- mni -- po --
  ten -- _ tem, fa --
  cto -- rem coe -- _
  li, coe -- li et
  ter -- _ rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 f
    f r2 f
    e e a4 g fis e
    d1 g2 e
    c c f! f
    e1 e
  }
}

AltoLyrics = \lyricmode {
  Pa --
  trem o --
  mni -- po -- ten -- _ _ _
  tem, fa -- cto --
  rem coe -- li et
  ter -- rae,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a1 b
    a r2 a
    a a a d~
    d4 c h! a g2 g
    a a d d4 d
    h1 a
  }
}

TenoreLyrics = \lyricmode {
  Pa -- _
  trem o --
  mni -- po -- ten -- _
  _ _ _ tem, fa --
  cto -- rem coe -- li et
  ter -- rae,
}

Basso = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f\breve
    f1 r2 d
    a'2. g4 fis2 d
    r2 g4 f e2 c
    f2. e4 d2 d
    e1 a,
  }
}

BassoLyrics = \lyricmode {
  Pa --
  trem o --
  mni -- po -- ten -- tem,
  fa -- _ cto -- rem
  coe -- _ li et
  ter -- rae,
}

Organo = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    f\breve
    f1 r2 d
    a'2. g4 fis2 d
    g2. f4 e2 c
    f2. e4 d1
    e a,
  }
}

BassFigures = \figuremode {
  <5 3>1 <6 4->
  <5 3>\breve
  <4>2 <_+> r1
  <_!> <6>
  r <6!>2 <5>
  <4> <_+>1.
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
