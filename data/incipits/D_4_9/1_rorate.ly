\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 6/4
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*4
    c'1 a2 d
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key f \major \time 6/4
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    f1 e2 a~
    a g f2. f4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
      R\breve*4
    c'1 a2 d
  }
}

SopranoLyrics = \lyricmode {
  Coe -- li, "coe -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    f1 e2 a~
    a g f2. f4
  }
}

AltoLyrics = \lyricmode {
  Coe -- li, coe --
  li de -- "su -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
      c1 a2 d~
    d c b2. b4
    a2 d g, c~
    c h c1
    r r2 a
  }
}

TenoreLyrics = \lyricmode {
  Coe -- li, coe --
  li de -- su --
  per, coe -- li de --
  su -- per,
  et
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a \bar "||"
    \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
      r1 f
    e2 a1 g2
    f2. f4 e2 a
    d,2. d4 c2 f~
    f c d2. d4
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ _ te
  coe --
  li, coe -- li
  de -- su -- per, de --
  _ su -- per, coe --
  li de -- "su -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 6/4
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a \bar "||"
    \clef tenor \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
      c1-! \clef bass f,
    e2 a1 g2
    f2. f4 e2 a
    d,1 c2 f~
    f c d1
  }
}

BassFigures = \figuremode {
  s4*6
  r1 <3>2 <6>
  <7> <3> <2> <[\t]>
  <3> <6> <3> q
  <7> <6!>1.
  r1 <5>
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
