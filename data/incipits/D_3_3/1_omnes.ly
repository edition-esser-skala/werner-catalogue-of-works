\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/2 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b'1 b2 b~
    b es1 es2
    d c c h
    c c c c
    a1 b!
  }
}

SopranoLyrics = \lyricmode {
  O -- mnes, o --
  mnes a --
  mi -- ci me -- _
  i de -- re -- li --
  que -- runt
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/2 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 g
    g g2 g
    g g g1
    g2 g1 es2
    c f1 e2
  }
}

AltoLyrics = \lyricmode {
  O -- mnes,
  o -- mnes a --
  mi -- ci me --
  i de -- re --
  li -- que -- runt
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/2 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1 b
    b2 c1 c2
    d es d1
    c2 es c c
    c d1 b2
  }
}

TenoreLyrics = \lyricmode {
  O -- mnes,
  o -- mnes a --
  mi -- ci me --
  i de -- re -- li --
  que -- _ runt
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/2 \tempoMarkup "Allabreve moderato" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b'1 g
    es c2 c
    h c g1
    c2 c es c
    f1 g
  }
}

BassoLyrics = \lyricmode {
  O -- mnes,
  o -- mnes a --
  mi -- ci me --
  i de -- re -- li --
  que -- runt
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/2 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    b'1 g
    es c2 c
    h c g1
    c es2 c
    f1 g
  }
}

BassFigures = \figuremode {
  r\breve
  <5>2 <6>1.
  r1 <4>2 <_!>
  r1 <6>
  <5>2 <6> <7> <6!>
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
