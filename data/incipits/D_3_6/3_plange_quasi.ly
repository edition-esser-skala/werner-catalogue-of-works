\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1 h2 cis
    d d1 c4 h
    a2 c h a
    gis e'1 c2
    a d1 h2
    g1 c
    h2 c1 h2
    c1 r2 cis~
  }
}

SopranoLyrics = \lyricmode {
  Plan -- _ _
  ge, plan -- _ _
  _ _ _ _
  ge qua -- si
  vir -- _ go
  plebs me --
  a, me -- _
  a, "u -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e2 a1 g2~
    g f e1~
    e2 d4 c dis1
    e r
    r2 f1 d!2
    h g' e a
    g\breve
    g1 r2 e~
  }
}

AltoLyrics = \lyricmode {
  Plan -- _ _
  ge, plan --
  _ _ _
  ge
  qua -- si
  vir -- _ go plebs
  me --
  a, "u -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r2 c e e
    a,\breve~
    a1. d2
    h1 r2 c~
    c a d1
    d2 e1 f2
    d e d1
    e r2 a,
  }
}

TenoreLyrics = \lyricmode {
  Plan -- _ ge,
  plan --
  _
  ge qua --
  si vir --
  go plebs __ _
  me -- a, me --
  a, "u -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1 e
    d a
    f'\breve
    e1 r2 a~
    a f d g~
    g e a f
    g c, g1
    c r
  }
}

BassoLyrics = \lyricmode {
  Plan -- ge,
  plan -- ge,
  plan --
  ge qua --
  si vir -- go, __
  _ vir -- go
  plebs _ me --
  a,
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    a'1 e
    d a
    f\breve
    e1 r2 a'~
    a f d g~
    g e a f
    g c, g1
    c \clef tenor a'~
  }
}

BassFigures = \figuremode {
  r1 <5 4>2 <6\\ 3>
  <5 4> <\t 3> <4> <3>
  <7>1 <6\\>
  <8 _+>\breve
  r
  r
  r1 <4>2 <3>
  r1 <_+>
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
