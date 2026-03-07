\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "Tardissime"
      \set Staff.timeSignatureFraction = 2/2
    d'1 d
    c1. d2
    d1 es
    d\breve
    e \bar "||"
    c1 d2 c
    b4 a b2 a1
    h h2 h
  }
}

SopranoLyrics = \lyricmode {
  Mi -- se --
  re -- re
  me -- i,
  De --
  us,
  se -- cun -- dum
  ma -- _ _ gnam
  mi -- se -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \tempoMarkup "Tardissime"
      \set Staff.timeSignatureFraction = 2/2
    f1. f2
    f1 a
    a2 g g1
    g\breve
    g \bar "||"
    f2 f1 fis2
    g4 fis g2 \hA fis1
    g as2 as
  }
}

AltoLyrics = \lyricmode {
  Mi -- se --
  re -- re
  me -- _ i,
  De --
  us,
  se -- cun -- dum
  ma -- _ _ gnam
  mi -- se -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/2 \tempoMarkup "Tardissime"
      \set Staff.timeSignatureFraction = 2/2
    b1 b
    b2 a a1
    b h2 c~
    c h4 a \hA h1
    c\breve \bar "||"
    a1 b!2 c
    d1 d
    d2 d1 d2
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se --
  re -- _ re
  me -- i, De --
  _ _ _
  us,
  se -- cun -- dum
  ma -- gnam
  mi -- se -- "ri -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/2 \tempoMarkup "Tardissime"
      \set Staff.timeSignatureFraction = 2/2
    b'1. b,2
    f'1 fis
    g1. g2
    g,\breve
    c \bar "||"
    f1 b2 a
    g1 d
    g f2 f
  }
}

BassoLyrics = \lyricmode {
  Mi -- se --
  re -- re
  me -- i,
  De --
  us,
  se -- cun -- dum
  ma -- gnam
  mi -- se -- "ri -"
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
  >>
}
