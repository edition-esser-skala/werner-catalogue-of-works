\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    g'1 a2. h4
    c2 c2. c4 h2
    a a1 gis2
    a c1 c2
    c e d2. d4
    d2 h e a,4 a
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    e1 f
    e2 a1 g2
    f f e2. e4
    e1 f2. f4
    f2 g g2. g4
    g2 g c, f~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g'1 a2. h4
    c2 c2. c4 h2
    a a1 gis2
    a c1 c2
    c e d2. d4
    d2 h e a,4 a
  }
}

SopranoLyrics = \lyricmode {
  Sub tu -- um
  prae -- si -- di -- um
  con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ne --
  trix, no -- stras de -- "pre -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e1 f
    e2 a a g
    f f e2. e4
    e1 f2. f4
    f2 g g2. g4
    g2 g c, f
  }
}

AltoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ne --
  trix, ne, ne, ne
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c2 c1 d2
    c2. d4 e2. e4
    c2 d h2. h4
    a1 a2. a4
    a2 c h2. h4
    h1 r
  }
}

TenoreLyrics = \lyricmode {
  Sub tu -- _
  um prae -- si -- di --
  um con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ne --
  trix,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 f2 d
    a' a,4 h c d e2
    f d e2. e4
    a,1 f'2. f4
    f2 c g'2. g4
    g1 r
  }
}

BassoLyrics = \lyricmode {
  Sub tu -- _
  um prae -- _ si -- _ di --
  um con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ne --
  trix,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    c1 f2 d
    a' a,4 h c d e2
    f d e1
    a, f'2. f4
    f2 c g'2. g4
    g1 \clef soprano << {  e''2 a, } \\ { c, f } >>
  }
}

BassFigures = \figuremode {
  r1. <5>4 <6>
  r1. <_!>2
  r <6 5> <4> <_+>
  r\breve
  r
  r
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
