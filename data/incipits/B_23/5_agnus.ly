\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "Andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    g'1. fis2
    gis a1 \hA gis2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus %4
  De -- _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "Andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 c~
    c2 h cis d~
    d c h1
  }
}

AltoLyrics = \lyricmode {
  A -- %3
  gnus De -- i, __
  qui "tol -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \tempoMarkup "Andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 g~
    g2 fis gis a~
    a4 d, g1 fis2
    g1 r2 a
    h c!4 a f'2 e4 d
  }
}

TenoreLyrics = \lyricmode {
  A --
  gnus De -- _
  _ _ _
  i, qui
  tol -- lis pec -- ca -- ta
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "Andante" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1. h2
    cis d1 c2
    h e a,1
    g a2 d4 c
    h2 a d e
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, De --
  i, qui tol --
  lis qui tol -- _
  lis pec -- ca -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "Andante"
      \set Staff.timeSignatureFraction = 2/2
    << {
      s1 g'~
      g2 fis gis a~
      a4 d, g2
    } \\ {
      c,1.^! h2
      cis d1 c2
      h e
    } >> a,1
    g a2 d
    h a d e
  }
}

BassFigures = \figuremode {
  r\breve*2
  r1 <3 7>2 <_ 6\\>
  <4> <3> <7 _+> <_+>
  <6\\>1 <6 5>2 <_+>
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
