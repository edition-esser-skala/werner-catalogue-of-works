\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 2/2 \tempoMarkup "[no tempo]"
    b'1
    c2 f
    es d4 c
    d2 d
    c2. c4
    b2 r
    R1*2
    f1
    g2 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 2/2 \tempoMarkup "[no tempo]"
    R1
    f
    g2 a
    b b
    b a
    b f
    f f4 f
    f2 e
    f r
    es!1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    b'1
    c2 f
    es d4 c
    d2 d
    c2. c4
    b2 r
    R1*2
    f1
    g2 c
  }
}

SopranoLyrics = \lyricmode {
  Ro --
  ra -- te
  coe -- li, _
  coe -- li
  de -- su --
  per,

  et %9
  nu -- bes
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    f
    g2 a
    b b
    b a
    b f~
    f f
    f e
    f r
    es!1
  }
}

AltoLyrics = \lyricmode {
  Ro --
  ra -- te
  coe -- li
  de -- su --
  per, coe --
  li
  de -- su --
  per,
  et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    b1
    c2 f
    es d4 c
    d2 d4 c
    b2. b4
    a2 r
    g1
  }
}

TenoreLyrics = \lyricmode {
  Ro --
  ra -- te
  coe -- li, _
  coe -- li _
  de -- su --
  per,
  et
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    f1
    g2 a
    b2. a4
    g1
    f2 r
    c1
  }
}

BassoLyrics = \lyricmode {
  Et
  nu -- bes
  plu -- ant
  iu --
  stum:
  "a -"
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 2/2 \tempoMarkup "[no tempo]"
    << {
      b''1
      c2 f
      es d4 c
      <b d>1
    } \\ {
      s1
      f
      g2 a
      b,1
    } >>
    \clef bass f
    g2 a
    b2. a4
    g1
    f
    c
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  <4>2 <3>
  <6> q
  r1
  <7>2 <6!>
  r1
  <_->
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
