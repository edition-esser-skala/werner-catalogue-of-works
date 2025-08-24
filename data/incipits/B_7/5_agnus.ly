\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    r2 c'2. h4 a2~
    a gis a a
    a a4 a a2 h
    c2. d4 e2 e,4 e
    c'2 c c1~
    c4 h8[ a] h2 a4 c2 d4
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De --
  _ i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di: Mi -- se --
  re -- re no --
  _ _ bis. A -- gnus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    e2. d4 c2 c
    f e1 f2
    f4 e8[ d] e4 e f2. f4
    e2 a1 gis2
    r e4 e a a a2~
    a gis a4 e2 g4
  }
}

AltoLyrics = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- _ lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se -- re -- re no --
  _ bis. A -- gnus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    c2. h4 a2. c4
    h1 a2 f
    c' cis4 cis d2 g,
    a4. g8 f2 e1
    r2 a4 a f'2 e4 dis
    e2 e, a c4 h
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ _ di:
  Mi -- se -- re -- re __ _
  no -- _ bis. A -- gnus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    r1 f2. e4
    d2 e a,1
    R\breve*3
    r1 a'2. g!4
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- _ i.

  A -- gnus
}

Organo = {
  \relative c {
    \clef tenor
    \key c \major \time 2/1 \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    c'2. h4 \clef bass f2. e4
    d2 e a, \clef tenor f'
    c' cis d g,
    a4. g8 f2 e1
    r2 a4 a f'2 e4 dis
    e2 e, \clef bass a2. g!4
  }
}

BassFigures = \figuremode {
  r\breve
  <6 5>2 <_+>1.
  <6 4>2 <\t 3>1 <7>2
  <5> q4 <6> <4>2 <_+>
  r1 <5 3>2. \once \bassFigureExtendersOn q4
  <6 4>2 <5 _+>1.
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
