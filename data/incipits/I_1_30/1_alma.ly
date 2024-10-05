\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Presto"
    R1
    a'2 d,4 d'~
    d8 cis d e f2
    e r4 d~
    d c! d4. d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Presto"
    R1*3
    r2 d
    a4 a'4. gis8 a h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1
    a'2 d,4 d'~
    d8 cis d e f2
    e r4 d~
    d c! d4. d8
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma Re -- %2
  dem -- pto -- ris Ma --
  ter, Re --
  dem -- pto -- ris
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*3
    r2 d2
    a4 a'4. gis8 a h
  }
}

AltoLyrics = \lyricmode {
  Al --
  ma Re -- dem -- pto -- ris
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    a2 d,4 d'~
    d8 cis d e f2
    e r4 d~
    d c! h c8[ d]
    e2 d
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma Re --
  dem -- pto -- ris Ma --
  ter, Re --
  dem -- pto -- ris
  "Ma -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*2
    r2 d
    a4 a'4. gis8 a h
    c!2 h
  }
}

BassoLyrics = \lyricmode {
  Al --
  ma Re -- dem -- pto -- ris
  Ma -- ter,
}

Organo = {
  \relative c {
    \clef tenor
    \key d \dorian \time 4/4 \tempoMarkup "Presto"
    a'2-! d,4-! d'~-!
    d8 cis d e f2
    e \clef bass d,
    a4 a'4. gis8 a h
    c!2 h
  }
}

BassFigures = \figuremode {
  r1
  <5>2 <6>
  <7>4 <6\\>2.
  <5 4>4 <\t 3> <4 2>2
  <9 6>4 <8 \t> <7> <6\\>
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
