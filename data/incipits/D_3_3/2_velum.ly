\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    b'2. b4 a1
    g2 r b2. a4
    g2. a8[ b] c4 g c b
    a2 b4 a g b a g
    fis\breve
  }
}

SopranoLyrics = \lyricmode {
  Ve -- lum tem --
  pli scis -- _
  _ _ _ _ sum, _
  scis -- _ _ _ _ sum _
  est,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    d2 g1 fis2
    g b2. a4 g2~
    g4 f es2. d4 c2~
    c4 c d1 c2
    d\breve
  }
}

AltoLyrics = \lyricmode {
  Ve -- lum tem --
  pli scis -- _ _
  _ _ _ _
  sum, scis -- sum
  est,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    d2 d d2. c4
    b a g2 d' b~
    b4 a g1 es'2
    c b1 es2
    a,\breve
  }
}

TenoreLyrics = \lyricmode {
  Ve -- lum tem -- _
  pli __ _ _ scis -- _
  _ _ sum,
  scis -- _ sum
  est,
}

Basso = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    g'2. g4 d1
    g, g'2. f!4
    es2. d4 c2. d8[ es]
    f2 b, es2. es4 \noBreak
    d\breve
  }
}

BassoLyrics = \lyricmode {
  Ve -- lum tem --
  pli scis -- _
  _ _ _ _
  _ sum, scis -- sum
  est,
}

Organo = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    g2 g' d1
    g, g'2. f!4
    es2. d4 c2. d8 es
    f2 b, es1
    d\breve
  }
}

BassFigures = \figuremode {
  r1 <4>2 <_+>
  r\breve
  r1 r
  r <7>2 <6>
  <_+>\breve
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
