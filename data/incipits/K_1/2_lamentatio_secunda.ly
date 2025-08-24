\version "2.24.2"
\include "header.ly"

SopranoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    r2 h'2.^\tutti c4 d c8[ h]
    a2. h8[ c] d2. e8[ fis]
    g4 g,2 a8[ h] c2. d8[ e]
    d2 e d4 a d c
    h\breve
  }
}

SopranoILyrics = \lyricmode {
  Va -- _ _ _
  _ _ _ _
  _ _ _ _ _
  _ _ _ _ _ _
  u.
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    r4 d2^\tutti e8[ fis] g1
    fis4 e d e fis2. g8[ a]
    g4 d g fis e a2 g4
    fis2 g2. fis8[ e] fis2
    g\breve
  }
}

AltoLyrics = \lyricmode {
  Va -- _ _
  u, __ _ va -- _ _ _
  _ _ _ _ _ _ _
  _ _ _ _
  u.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    h\breve^\tutti
    a
    g1 a
    a\breve
    g
  }
}

TenoreLyrics = \lyricmode {
  Va --
  _
  _ _
  u. __
  _
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    h'\breve^\tutti
    a
    g1 a
    a\breve
    g
  }
}

BassoLyrics = \lyricmode {
  Va --
  _
  _ _
  u. __
  _
}

Cembalo = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \tempoMarkup "Moderato"
      \set Staff.timeSignatureFraction = 2/2
    g'2-\tutti g,2. a4 h c
    d e fis e d a d c
    h2 e c a
    d c d d,
    g4 d' e fis g h, c d
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1 <6>
  <_+> <5 4>2 <\t _+>
  r\breve
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
