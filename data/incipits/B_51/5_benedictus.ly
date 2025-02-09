\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
    R2.
    g'4^\solo es d
    c b8[ a] b4
    b8[ a] a4 r
    r r f'~
    f b2
  }
}

AltoLyrics = \lyricmode {
  Be -- _ ne --
  di -- ctus, qui
  ve -- nit
  in __
  "no -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
    d4^\solo b a
    g8[ fis] g4 g
    fis g8[ fis] g4
    g8[ fis] fis4 d'
    es2 es4
    d r d
  }
}

TenoreLyrics = \lyricmode {
  Be -- _ ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit in
  no -- mi --
  ne, in
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Larghetto"
    g'2 d4
    es c b
    a g cis
    d2 b4
    c g a
    b d g
  }
}

BassFigures = \figuremode {
  r2 <_+>4
  r2 <6>4
  <6\\>2 <7 5>4
  <6 4> <5 _+> r
  r <6> <6 5>
  r2.
}

\score {
  <<
    \new ChoirStaff <<
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
