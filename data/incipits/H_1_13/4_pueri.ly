\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4^\solo c2
    h4 d4. d8
    c4 e4. e8
    a,4 d c~
    c h a
    a gis a
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da --
  te pu -- e --
  ri Do -- mi --
  num: Lau -- da --
  te, lau --
  da -- te "no -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'2-\solo e4
    g2 d4
    a'2 g4
    f2 e4
    d4. e8 f4
    e4. d8 c4
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2.
  r2 <6>4
  <7> <6> q
  <7> <6>2
  <4>4 <_+>2
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
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
