\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 a'^\solo cis,
    d e f
    e8[ f] g4 d
    cis cis r
    r e2
    f4. g16[ a] b8[ g]
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit
  in
  no -- _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
    d8-\solo e f4 a
    f cis d
    g4. a8 b4
    a a, g'
    f cis a
    d d' g,
  }
}

BassFigures = \figuremode {
  r2 <_+>4
  r2.
  <6>2 <3>4
  <_+>2 <\t>4
  <6>2.
  r
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
