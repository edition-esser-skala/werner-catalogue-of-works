\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    R1*6
    g'1~
    g2 fis
  }
}

SopranoLyrics = \lyricmode {
  A --
  gnus
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    R1*5
    c1~
    c2 h
    cis d
  }
}

AltoLyrics = \lyricmode {
  A --
  gnus
  De -- i,
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    R1
    g~
    g2 fis
    gis a~
    a4 d, g2~
    g fis
    g1
    r2 a
  }
}

TenoreLyrics = \lyricmode {
  A --
  gnus
  De -- _
  _ _
  _
  i,
  qui
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    c1~
    c2 h
    cis d~
    d c
    h e
    a,1
    g
    a2 d4 c
  }
}

BassoLyrics = \lyricmode {
  A --
  gnus
  De -- _
  _
  i, qui
  tol --
  lis,
  qui "tol -"
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Andante"
    << {
      s1
      g'~
      g2 fis
      gis a~
      a4 d, g2
    } \\ {
      c,1~
      c2 h
      cis d~
      d c
      h e
    } >>
    a,1
    g
    a2 d
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  <7 3>2 <6\\>
  <4> <3>
  <7 _+> <_+>
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
