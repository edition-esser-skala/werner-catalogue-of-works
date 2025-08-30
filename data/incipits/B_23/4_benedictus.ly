\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Molto moderato"
      \set Staff.timeSignatureFraction = 2/2
    a'1 a
    h a
    R\breve*2
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Molto moderato"
      \set Staff.timeSignatureFraction = 2/2
    a'1 a2 a~
    a gis a1
    R\breve*2
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di --
  _ ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Molto moderato"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    c1 c
    d c
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Molto moderato"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    c'1 c2 c~
    c h c1
  }
}

BassoLyrics = \lyricmode {
  Be -- ne -- di --
  _ ctus,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key a \minor \time 4/2 \tempoMarkup "Molto moderato"
      \set Staff.timeSignatureFraction = 2/2
    a'4-\solo g f e f e d c
    d c8 h e4 d c d c h
    a a' g! f e c'8 h a4 g
    f e8 d g4 f e f e d
  }
}

BassFigures = \figuremode {
  r\breve
  <6 5>2 <_+> <6>1
  r\breve
  <6 5>1 <6>
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
