\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    fis'2~\p fis8 a, a a
    r h dis fis e4. e8
    d4. d8 d16( e) d( e) d( e) d( e)
    cis fis, ais cis fis cis ais fis r8 a'\f a a
    r g g g r a a a
    r a a a r g g fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    a'2~\p a8 c c fis,
    r fis h fis gis( h) ais8.\trill gis32( ais)
    h8 fis h h gis gis gis gis
    ais16 fis ais cis fis cis ais fis r8 fis'\f fis fis
    r e e e r c c c
    r fis! fis fis r h, h h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a'4.^\solo d8 c a4 c8
    h[ dis] fis a, gis4 ais
    h1
    ais4 r a^\tutti d
    c1~
    c2 h
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun --
  di: Mi -- se --
  re --
  re
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 fis4.^\tutti fis8
    g4 g a4. a8
    fis!4 fis g4. fis8
  }
}

AltoLyrics = \lyricmode {
  Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 a!4.^\tutti a8
    g4 e' a,2~
    a g4 r
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se --
  re -- re no --
  bis,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 d4.^\tutti d8
    e4. e8 f4. f8
    dis4 dis e4. d8
  }
}

BassoLyrics = \lyricmode {
  Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    d2-\solo dis~
    dis d4 cis
    h8 h' g g eis eis eis eis
    fis4 r d8-\tutti d d d
    e e e e f f f f
    dis dis dis dis e e e d
  }
}

BassFigures = \figuremode {
  r2 <7! 5>
  <6 5> <4\+ 2>4 <6\\>
  r2 <7 5>
  <_+> <5!>
  <6!> <5!>
  <7! 5>2.. <6>8
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
