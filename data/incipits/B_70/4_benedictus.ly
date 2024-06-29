\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    a'2. cis4 d2
    e1 d2~
    d cis d~
    d4 c b a b2
    a4 b c2. b4
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne --
  di -- _
  ctus, qui __
  _ ve -- _ _
  nit in no -- "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    f2. e4 a2
    a4 g f1
    e2 a2. g4
    f1 e2
    f4 g a2 a4 g
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di --
  ctus, qui ve --
  nit, ve -- _
  _ _
  nit in no -- mi -- ne
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    d2. a4 f2
    cis d1
    a'2. g4 f e
    d2 g1
    f2. g4 a2
  }
}

TenoreLyrics = \lyricmode {
  Be -- _ _
  ne -- di --
  ctus, qui ve -- _
  nit, ve --
  nit in "no -"
}

Organo = {
  \relative c {
    \clef tenor
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]"
    d'2. a4 f2
    cis d1
    a'2. g4 f e
    d2 g1
    f2. g4 a2
  }
}

BassFigures = \figuremode {
  r2. <_+>4 <6>2
  r <9> <8>
  <4> <_+> r
  r <7 _-> <6 \t>
  r1.
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
