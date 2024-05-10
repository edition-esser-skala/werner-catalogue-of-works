\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key g \minor \time 2/2 \autoBeamOff
    d'1^\tutti
    es
    d2 c
    d1
    g,2 g4 a
    b a b c
    d e f2~
    f e4 d
    cis a c2~
    c b!
  }
}

SopranoLyrics = \lyricmode {
  O! __
  _
  _ _
  cle --
  mens, o __ _
  _ _ _ _
  _ _ _
  _ _
  _ _ _
  _
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key g \minor \time 2/2 \autoBeamOff
    R1*5
    g'1^\tutti
    b
    a2 g
    a1
    d,2 g~
  }
}

AltoLyrics = \lyricmode {
  O! __
  _
  _ _
  cle --
  mens, o
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key g \minor \time 2/2 \autoBeamOff
    R1*10
  }
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key g \minor \time 2/2 \autoBeamOff
    R1*10
  }
}

Organo = {
  \relative c {
    \clef soprano
    \twotwotime \key g \minor \time 2/2
    d''1-\tutti
    es
    d2 c
    d1
    g,2. a4
    << {
      b a b c
      d e f2~
      f e4 d
      cis a c2~
      c b!
    } \\ {
      g1
      b
      a2 g
      a1
      d,2 g
    } >>
  }
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "S" "vl 1" "vl 2" }
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "A" "vla 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "vla 2" }
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
