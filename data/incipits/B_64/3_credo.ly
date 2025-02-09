\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a4^\solo d e
    f2 e4
    d e fis
    g2 a4
    b c, a
    a8[ g] g4 r
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- tem, fa --
  cto -- rem
  coe -- li et
  ter -- rae,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
    d2-\solo cis4
    d d' g,8 a
    b2 a4
    g8 a b4 f!
    e2 f4
    c c' b
  }
}

BassFigures = \figuremode {
  r2.
  r2 <6>4
  r2 <6\\>4
  r <6>2
  <6 5>2.
  <6 4>
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
