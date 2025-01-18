\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 6/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2
      \set Staff.timeSignatureFraction = 2/2
      c'1 a2 d~
    d4 c f1 e2
    f1 r
    r4 d g, a b c d2~
    d4 c c d e2 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 6/4 \tempoMarkup "[no tempo]"
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2
      \set Staff.timeSignatureFraction = 2/2
      r1 f
    a2. g8 f g2. g4
    a1 r4 a e fis
    g2. g4 g a b2~
    b a g a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 6/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2
      \set Staff.timeSignatureFraction = 2/2
      c'1 a2 d~
    d4 c f1 e2
    f1 r
    r4 d g, a b c d2~
    d4 c c d e2 f
  }
}

SopranoLyrics = \lyricmode {
  Coe -- li, coe --
  li de -- su --
  per,
  et nu -- bes plu -- ant, nu --
  bes plu -- ant, plu -- ant
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 6/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2
      \set Staff.timeSignatureFraction = 2/2
      r1 f
    a2. g8[ f] g2. g4
    a1 r4 a e fis
    g2. g4 g a b2~
    b a g a
  }
}

AltoLyrics = \lyricmode {
  Coe --
  _ li de -- su --
  per, et nu -- bes
  plu -- ant, nu -- bes plu --
  ant, nu -- bes
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 6/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6 \bar "||"
    \time 4/2
      \set Staff.timeSignatureFraction = 2/2
      R\breve
    r1 c
    a2 d2. c4 c2
    b2. b4 d c b a
    g2 a c c
  }
}

TenoreLyrics = \lyricmode {
  Coe --
  li, coe -- li de --
  _ su -- per, _ et __ _
  nu -- bes plu -- ant,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 6/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a\fermata \bar "||"
      \set Staff.timeSignatureFraction = 2/2
    \time 4/2
      \set Staff.timeSignatureFraction = 2/2
      R\breve*2
    f1 a
    g2. g4 g b g f
    e2 f c1
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ _ te

  coe -- li
  de -- su -- per, et nu -- bes
  plu -- ant, "plu -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 6/4 \tempoMarkup "[no tempo]"
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a\fermata \bar "||"
    \clef soprano \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    << {
      c'1 a2 d~
      d4 c f2
    } \\ {
      r1 f,
      a2. g8 f
    } >> \clef tenor c1
    \clef bass f, a
    g g2. f4
    e2 f c1
  }
}

BassFigures = \figuremode {
  r4*6
  r\breve
  r1 <4>2 <3>
  <5> <6> <4> <3>
  <_->1 <3 1>4 <4 2> <5 3> <\t \t>
  <7 5> <6 \t> <5> <6> <5 3>2 <6 4>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
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
