\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*5
    g'1 a2. a4
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 d
    e2. e4 fis2 g~
    g fis g e
    d1 c4 d e fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*5
    g'1 a2. a4
  }
}

SopranoLyricsA = \lyricmode {
  E -- gre -- "gi -"
}

SopranoLyricsB = \lyricmode {
  Sit Tri -- "ni -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
      \phrasingSlurDashed
    R\breve*2
    r1 d
    e2. e4 fis2 g\(
    g\) fis g e
    d1 c4 d e fis
  }
}

AltoLyricsA = \lyricmode {
  E --
  gre -- gi -- e do --
  _ ctor Pau -- _
  le, Pau -- _ _ \hy
}

AltoLyricsB = \lyricmode {
  Sit
  Tri -- ni -- ta -- ti
  sem -- pi -- ter -- na
  glo -- _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
      \phrasingSlurDashed
    g1 a2. a4
    h2 c\( c\) h
    c( a) g fis
    g a d, h'
    cis d1 c2\(
    c\) h a1
  }
}

TenoreLyricsA = \lyricmode {
  E -- gre -- gi --
  e do -- _ ctor
  Pau -- le, e --
  gre -- gi -- e do --
  ctor, do -- ctor __
  _ _ 2Pau -
}

TenoreLyricsB = \lyricmode {
  Sit Tri -- ni --
  ta -- ti sem -- pi --
  ter -- na glo --
  _ ri -- a, Tri --
  ni -- ta -- ti
  sem -- pi -- "ter -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*6
  }
}

BassoLyricsA = \lyricmode {
  %tacet
}

BassoLyricsB = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef tenor
    \key g \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'1-! a2.-! a4-!
    h2 c1 h2
    c a << {
      d1
      e2. e4 fis2 g~
      g fis g e
    } \\ {
      g,2 fis
      g a d, h'
      cis d1 c2~
      c
    } >> h a1
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r
  r
  <5 2>2 <6> <8 #(dotbf 5)>2. <_ 6\\>4
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
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
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
