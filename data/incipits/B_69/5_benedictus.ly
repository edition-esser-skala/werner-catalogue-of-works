\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    r4 e'2^\solo d4
    c2 h8 c d[ c16 h]
    a4 r r c~
    c h a2
    g4 c h16[ c h c] d[ e f d]
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  nit, be --
  ne -- di --
  ctus, qui ve \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1
    r4 a'2^\solo g4
    f2 e8 f g[ f16 e]
    d4 r r f~
    f e d2
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  nit, be --
  ne -- "di -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Larghetto"
    a'8-\solo h c h16 a gis8 e fis \hA gis
    a f c d e d16 c h8 c
    d c16 h a8 h c d e f
    g f16 e d8 e f f,16 g a8 h
    c d e f g g, h g
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r q <5 4> <6>
  r q2.
  <5 4>4 <6> <9> <6>
  <5 4> <6>2.
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
