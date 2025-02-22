\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    r4 h'2\p h4~
    h ais h4. fis'8
    d1
    h~
    h4 ais h r
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    r4 g'\p gis2
    fis~ fis8 dis fis4
    g!2 h
    e, fis!4 gis
    fis2 fis4 r
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'2.^\solo d4
    cis2 h4 fis
    g h8 d f f f4
    e8 h4 h16[ cis] d4. \hA cis16[ h]
    h8.[ cis16] cis4\trill h r
    R1
    r4 r8 c a4 h8 d
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se -- re -- re
  no -- _ bis.

  qui tol -- lis "pec -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r2 d~^\solo
    d4 c! h2
    c8 a e'4 fis!8 fis g h
  }
}

AltoLyrics = \lyricmode {
  A --
  gnus De --
  i, qui tol -- lis pec -- ca -- ta
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r2 r4 h^\solo
    gis a2 \hA gis4
    a r8 a d4 g,8 g
  }
}

TenoreLyrics = \lyricmode {
  A --
  gnus De -- _
  i, qui tol -- lis "pec -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r2 r4 g'^\solo
    f dis e2
    a,4 r r2
  }
}

BassoLyrics = \lyricmode {
  A --
  gnus De -- _
  i,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    g'2-\solo eis
    fis4. e8 dis2
    h1
    gis2 fis!4 eis
    fis2 h4 g'!
    f dis e2
    a,4 \clef tenor r8 a' d4 g,!
  }
}

BassFigures = \figuremode {
  r2 <7 5>
  <5\+ 4>4 <\t _+> <6>2
  <6 _!> <5!>
  <6> <6 4>4 <7 5>
  <5\+ 4> <\t _+>2.
  <4 2\+>4 <7 5> <5 4> <\t _+>
  r2 <_+>
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
