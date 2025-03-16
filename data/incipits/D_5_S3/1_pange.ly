\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c'1 c2
    h1 h2
    r c gis
    a1.
    gis2 g h
    c1 c2~
    c c h
    c e e
    h1 h2
    a h c
    h1 h2
  }
}

SopranoLyricsA = \lyricmode {
  Pan -- ge,
  lin -- gua,
  glo -- ri --
  o --
  si cor -- po --
  ris my --
  ste -- ri --
  um, san -- gui --
  nis -- que
  pre -- _ ti --
  o -- si,
}

SopranoLyricsB = \lyricmode {
  No -- bis
  da -- tus,
  no -- bis
  na --
  tus ex in --
  ta -- cta __
  Vir -- gi --
  ne, et in
  mun -- do
  con -- _ ver --
  sa -- tus,
}

SopranoLyricsC = \lyricmode {
  In su --
  pre -- mae
  no -- cte
  coe --
  nae re -- cum --
  bens cum __
  fra -- tri --
  bus ob -- ser --
  va -- ta
  le -- _ ge
  ple -- ne
}

SopranoLyricsD = \lyricmode {
  Ver -- bum
  ca -- ro,
  pa -- nem
  ve --
  rum ver -- bo
  car -- nem __
  ef -- fi --
  cit, fit -- que
  san -- guis
  Chri -- _ sti
  me -- rum,
}

SopranoLyricsE = \lyricmode {
  Tan -- tum
  er -- go
  sa -- cra --
  men --
  tum ve -- ne --
  re -- mur __
  cer -- nu --
  i, et an --
  ti -- quum
  do -- _ cu --
  men -- tum
}

SopranoLyricsF = \lyricmode {
  Ge -- ni --
  to -- ri
  ge -- ni --
  to --
  que laus et
  iu -- bi --
  la -- ti --
  o, sa -- lus,
  ho -- nor,
  vir -- _ tus
  quo -- que
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    g'1 g2
    g1 g2
    r e e
    e1 d2
    e e f
    g2. f4 e2
    a g2. f4
    e2 g g
    e1 e2
    e1 fis2
    gis1 gis2
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    e1 e2
    d1 d2
    r c h
    a1.
    h2 h d
    e2. d4 c2
    c d2. d4
    c2 c c
    h1 h2
    c1 c2
    e1 e2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c1 c2
    g'1 g2
    r a e
    f1.
    e2 e d
    c2. d4 e2
    f g2. g4
    c,2 c' c
    gis1 gis2
    a a,1
    e' e2
  }
}

\score {
  <<
    \new ChoirStaff \with { \setGroupDistance #10 #10 } <<
      \new Staff \with { \setStaffDistance #25 } {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC
      \new Lyrics \lyricsto Soprano \SopranoLyricsD
      \new Lyrics \lyricsto Soprano \SopranoLyricsE
      \new Lyrics \lyricsto Soprano \SopranoLyricsF

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
    >>
  >>
}
