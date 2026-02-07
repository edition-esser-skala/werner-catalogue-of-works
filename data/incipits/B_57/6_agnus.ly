\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 d'
    c c
    c r2 e
    e d4 c h2 c
    c c c h
    c c1 h4 a
    gis2 a a \hA gis
  }
}

SopranoLyrics = \lyricmode {
  A --
  gnus De --
  i, qui
  tol -- _ _ lis pec --
  ca -- ta mun -- _
  di: Mi -- se -- _
  re -- re no \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    f1 f2 f~
    f e4 d e1
    r2 a a g4 f
    e2. f4 g1
    a2 e f1
    e f2. f4
    e2 e e1
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De --
  _ _ i,
  qui tol -- _ _
  lis pec -- ca --
  _ ta mun --
  di: Mi -- se --
  re -- re "no -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    a1 b
    g\breve
    a2 f' f e4 d
    c1 d2 e
    a,4 h c2 d1
    g,2 a1 d2
    d c h1
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De --
  i, qui tol -- _ _
  lis pec -- ca --
  ta __ _ _ mun --
  di: Mi -- se --
  re -- re "no -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1 b
    c\breve
    f1 r2 c'
    c h4 a g2 e
    f a d,1
    c d2. d4
    e2 a e1
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De --
  i, qui
  tol -- _ _ lis pec --
  ca -- ta mun --
  di: Mi -- se --
  re -- re "no -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1 b
    c\breve
    f1 r2 c'~
    c h4 a g2 e
    f a d,1
    c d
    e2 a e1
  }
}

BassFigures = \figuremode {
  r1 <5>
  <5 4> <\t 3>
  r\breve
  r1 <_!>2 <6>
  r <5> <7> <6!>
  <5> <6> <7> <6!>
  <7 _+>1 <4>2 <_+>
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
