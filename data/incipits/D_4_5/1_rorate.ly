\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 6/4
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" R1
    r2 d'~
    d4 c b a
    g2 c~
    c4 b a g
    f2 f~
    f e
    f r
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key d \minor \time 6/4
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" r2 a'~
    a4 g f e
    d2 d~
    d e~
    e c
    c d
    c2. c4
    c1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" R1
    r2 d'~
    d4 c b a
    g2 c~
    c4 b a g
    f2 f~
    f e
    f r
  }
}

SopranoLyrics = \lyricmode {
  Coe -- %3
  li de -- su --
  per, coe --
  li de -- su --
  per, de --
  su --
  per,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" r2 a'~
    a4 g f e
    d2 d~
    d e~
    e c~
    c d
    c2. c4
    c1
  }
}

AltoLyrics = \lyricmode {
  Coe --
  li de -- su --
  per, coe --
  li, __
  coe --
  li
  de -- su --
  per,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" R1
    d2. c4
    b a g2~
    g g~
    g a~
    a b4 b
    g2. g4
    a2 c
  }
}

TenoreLyrics = \lyricmode {
  Coe -- li
  de -- su -- per, __
  coe --
  li, __
  coe -- li
  de -- su --
  per, et
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a\fermata \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" a2. g4
    f e d2~
    d g~
    g4 f e d
    c2 f~
    f4 e d b
    c2. c4
    f,1
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ _ te
  coe -- li
  de -- su -- per, __
  coe --
  li de -- su --
  per, coe --
  li, coe -- li
  de -- su --
  per,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 6/4
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a\fermata \bar "||"
    \time 2/2 \tempoMarkup "Allabreve" a2. g4
    f e d2~
    d g~
    g4 f e d
    c2 f~
    f4 e d b
    c1
    f,2 \clef alto c''-!
  }
}

BassFigures = \figuremode {
  r4*6
  <_+>1
  <6>
  r
  r2 <6>
  r1
  r2 <6>
  <4> <3>
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
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
