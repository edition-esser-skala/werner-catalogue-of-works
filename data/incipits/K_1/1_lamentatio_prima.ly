\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    f4 g a4. a8
    a2 a4 a
    a a a a8 a
    b4 g8 g f4 e
    f g g2
    f r
  }
}

AltoLyrics = \lyricmode {
  In -- _ _ ci --
  pit la -- men --
  ta -- ti -- o Ie -- re --
  mi -- ae Pro -- phe -- _
  _ _ tae. __
  _
}

Cembalo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    f8 a e c f c a c
    f, f' a g f g f e
    d e f e d a d c
    b g c b a d c b
    a d b g c b c c,
    f f' e d c b a g
  }
}

BassFigures = \figuremode {
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
