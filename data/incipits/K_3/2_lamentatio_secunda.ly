\version "2.24.2"
\include "header.ly"

SopranoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1*2
    h'4 a g r
    R1
    r8 g[ h c] d4 g,
  }
}

SopranoILyrics = \lyricmode {
  La -- _ med

  La -- _ med
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1*2
    d8 g4 fis8 g4 r
    r2 r8 d[ e fis]
    g4 g, r2
  }
}

AltoLyrics = \lyricmode {
  La -- _ _ med
  La --
  _ med
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    h4 a g a
    a2 g4 r
    r2 g4^\solo a
    h h8 h h4 h8 h
    h4 h h h8 h
  }
}

TenoreLyrics = \lyricmode {
  La -- _ _ _
  med. __ _
  Ma -- _
  _ tri -- bus su -- is di --
  xe -- runt: U -- bi est
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1
    r2 r8 d[^\tutti e fis]
    g[ h, c d] g,4 r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  La --
  _ med
}

Cembalo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    g8 g' fis d e h c a
    d c d d, g d' e fis
    g h, c d g, h' fis d
    g, g' d h << { g'4. } \\ { g,4 } >> fis'8
    e4 d8 c h d e d
  }
}

BassFigures = \figuremode {
  r1
  <4>4 <3>2.
  r4 <6 5>2.
  r1
  r
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S 1"
        \new Voice = "SopranoI" { \dynamicUp \SopranoI }
      }
      \new Lyrics \lyricsto SopranoI \SopranoILyrics

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
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
