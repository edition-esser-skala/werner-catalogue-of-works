\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 2/2 \tempoMarkup "Andante"
    R1*12 %
    d'1
    a2 c
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key d \minor \time 2/2 \tempoMarkup "Andante"
    R1*8
    a'1
    d,2 f
    b a
    g a
    f d
    r a'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    R1*12
    d'1
    a2 c
  }
}

SopranoLyrics = \lyricmode {
  Sal --
  ve, "sal -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    R1*8
    a'1
    d,2 f
    b a
    g a
    f d
    r a'
  }
}

AltoLyrics = \lyricmode {
  Sal --
  ve, sal --
  _ _
  ve Re --
  gi -- na,
  "sal -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    d1
    a2 c
    f e
    d e
    c a
    r d
    d1
    d2 cis
    d d
    c! a
  }
}

TenoreLyrics = \lyricmode {
  Sal --
  ve, sal --
  _ _
  ve Re --
  gi -- na,
  Re --
  gi --
  _ _
  na, sal --
  ve, "sal -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Andante"
    a'1
    d,2 f
    b a
    g a
    f d
    r a'
    a1
    a2 gis
    a2. g4
    f2 d
    g f
    e1
    d2 r
    R1
  }
}

BassoLyrics = \lyricmode {
  Sal --
  ve, sal --
  _ _
  ve Re --
  gi -- na,
  Re --
  gi --
  _ _
  na, sal --
  ve Re --
  gi -- _
  _
  na,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 2/2 \tempoMarkup "Andante"
    a'1-!
    d,2-! f-!
    b-! a-!
    g-! a-!
    << {
      d1
      a2 c
      f e
      d e
    } \\ {
      f,2 d
      r a'
      a1~
      a2 gis
    } >>
    a2. g4
    f2 d
    g f
    e1
    d2 \clef tenor d'
    c! a
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  r
  r
  r
  <3>2. <\t>4
  r1
  <_->2 <6>
  <7> <6\\>
  r1
  <6>
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
