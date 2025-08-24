\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c'2. h4 a2
    g r4 g a8[ g] a4
    h c2 h4 c c~
    c d g, g a h
    c8[ h] c2 h4 r g
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di --
  ctus, qui ve -- _
  nit, ve -- _ nit, ve --
  _ nit, qui ve -- _
  _ _ nit, "ve -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r f~
    f4 e d2 c
    r4 c d8[ c] d4 e e
    f2 e fis4 g~
    g fis g2 e
  }
}

AltoLyrics = \lyricmode {
  Be --
  ne -- di -- ctus,
  qui ve -- _ nit, qui
  ve -- nit, ve -- _
  _ nit, "be -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    c2. h4 a2
    g r4 f g8[ f] g4
    a h c e d2
    e4 d8[ c] d2 c~
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne -- di -- %2
  ctus, qui ve -- _
  _ _ nit, qui ve --
  _ _ nit, "be -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r2 r f~
    f4 e d2 c
    r c2. h4
    a2 g r
  }
}

BassoLyrics = \lyricmode {
  Be --
  ne -- di -- ctus,
  be -- ne --
  di -- ctus,
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    << { c''2._! h4_! a2 } \\ { s2 s f } >>
    \clef tenor c2. h4 \clef bass f2~
    f4 e d2 c
    r c2. h4
    a2 g \clef tenor c'
  }
}

BassFigures = \figuremode {
  r1.
  <5 4>4 \bassFigureExtendersOn <5 3> <5 2> \bassFigureExtendersOff <6>2.
  <4 2>4 <6> <7> <6>2.
  r2 <3> <4\+ 2>4 <6>
  <7> <6\\> r1
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
