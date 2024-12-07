\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/2  \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    h'1 h2 h
    h1 h2 cis
    d1 g,2 g
    c! c h h~
    h cis dis e~
    e dis e1\fermata
  }
}

SopranoLyrics = \lyricmode {
  Tri -- stis est
  a -- ni -- ma
  me -- a us --
  que ad mor -- tem, __
  ad mor -- _
  _ tem:
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 4/2  \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    gis'1 gis
    gis2 gis2. gis4 gis2
    a h c1
    r2 a1 g!2~
    g g fis g
    fis1 gis\fermata
  }
}

AltoLyrics = \lyricmode {
  Tri -- stis
  est a -- ni -- ma
  me -- _ a
  us -- que, __
  us -- que ad
  mor -- tem:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 4/2  \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e1 e
    e2 e2. e4 e2
    f1 e
    r2 e1 e2~
    e4 e, g2 h1~
    h h\fermata
  }
}

TenoreLyrics = \lyricmode {
  Tri -- stis
  est a -- ni -- ma
  me -- a
  us -- que __
  _ ad mor --
  tem:
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 4/2  \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e1 e
    e2 e2. e4 e2
    d1 c
    r2 a e'1
    e h~
    h e\fermata
  }
}

BassoLyrics = \lyricmode {
  Tri -- stis
  est a -- ni -- ma
  me -- a
  us -- que
  ad mor --
  tem:
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    e\breve
    e2 e e1
    d c
    r2 a e'1
    e h~
    h e\fermata
  }
}

BassFigures = \figuremode {
  <_+>\breve
  r1 <5 _+>2 <6\\ \t>
  <8 5> <\t 6>1.
  r1 <5 4>2 <\t _!>
  <5> <6\\> <5 _+> <6 4>
  <5 \t> <\t _+> r1
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
