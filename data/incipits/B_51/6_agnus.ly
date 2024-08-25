\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r4 d' c a'
    d,2 e~
    e4 a16 h c8 h8 a g4
    fis2\trill fis8 g4 fis8
    g4 e a4. g8
    fis4. fis8 e2~
    e8 e e e dis4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    fis1\p
    g2 h
    a4. g8 fis4 h~
    h8 h ais4 h8 d4 a?8
    h4. h,8 fis'4. g8
    a fis dis h h'4 c
    cis8 cis cis cis h4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'4.^\solo d8 fis,[ a] c h
    g4 g8 h e, gis h[ d]
    cis!4 d8 e fis4. e8
    d4 cis\trill h r
    R1*2
    r2 r8 fis4 h8
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se -- re -- re
  no -- _ bis.

  Mi -- "se -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*4
    g'4.^\solo h8 dis,([ fis)] a h
    c h4 a8 gis4 a
    g2\trill fis8 dis4 dis8
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*6
    r2 h4. h8
  }
}

TenoreLyrics = \lyricmode {
  Mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*7
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d2-\solo a'
    h gis
    a8 g fis e dis4 e
    fis2 h,4. d8
    g2 fis4. e8
    dis2 d4 c
    ais8 ais ais ais h4 \clef tenor h'
  }
}

BassFigures = \figuremode {
  r2 <6 _!>
  <6> <6>4 <5>
  <_+> <6>8 <6!> <6> <5> <9> <8>
  <6 4>4 <5 _+> r8 <6>4.
  <5>4 <6> <6\\>2
  <7!>8 <6>4 <5>8 <4\+ 2>4 <6>
  <7! 5>2 <_+>4 q
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
