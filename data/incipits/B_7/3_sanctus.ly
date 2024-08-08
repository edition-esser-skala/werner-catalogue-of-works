\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r2 c'2. h8[ a] h2~
    h4 a8[ h] c2. h8[ c] d4 c
    h2 c2. h8_[ a] h2
    c1 r
    r c2. a4
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ _ _ _
  ctus, san -- _ _
  ctus
  Do -- "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    e2. d8[ e] f2. e8[ f]
    g2. f8[ g] a2 a
    g2. f8[ e] f1
    e2 e a2. f4
    d2 g e a
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ _
  _ _ _ ctus,
  san -- _ _
  ctus Do -- _ mi --
  nus De -- us, "De -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g2 c a d
    g, e'1 d2~
    d e a, d
    g, c2. a4 d2
    h e2. c4 a2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san -- _
  ctus, san -- _
  ctus, san -- _
  ctus Do -- mi -- nus
  De -- _ _ us,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c2. h8[ c] d2. c8[ d]
    e2. d8[ e] f2. e8[ f]
    g4 f e d8[ c] d1
    c f2. d4
    g2 e a f
  }
}

BassoLyrics = \lyricmode {
  San -- _ _ _
  _ _ _ _
  _ _ _ _ _
  ctus Do -- mi --
  nus De -- _ us
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 2/1 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c2. h8 c d2. c8 d
    e2. d8 e f2. e8 f
    g4 f e d8 c d1
    c1 f2. d4
    g2 e a f
  }
}

BassFigures = \figuremode {
  r1 <7>2 <6>
  <5> <6> <5> <6>
  r <6> <7> <6>
  r1 <5>2 <6>
  r\breve
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
