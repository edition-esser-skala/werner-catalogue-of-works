\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    R1*8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    R1*8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto moderato"
    a'2^\solo h
    a4 d2 c4
    h e2 d4
    e2 r4 e
    a,4. h8 gis gis a4~
    a gis a r
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da --
  te pu -- e --
  ri Do -- mi --
  num: Lau --
  da -- te no -- men Do --
  mi -- ni.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto moderato"
    R1*4
    r2 r4 a^\solo
    f' e8[ d] c4 c8 d
    e4 a a8[ gis] gis4
    e a2 f4
  }
}

AltoLyrics = \lyricmode {
  Sit
  no -- men Do -- mi -- ni
  be -- ne -- di -- ctum,
  ex hoc nunc
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto moderato"
    R1*2
    r2 a^\solo
    c4. c8 h4 cis
    d8[ a] d2 c4
    h4. h8 a2
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  Lau --
  da -- te no -- men,
  no -- _ men
  Do -- mi -- ni.
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto moderato"
    R1*6
    r2 r4 e^\solo
    a2 f4 d
  }
}

BassoLyrics = \lyricmode {
  ex
  hoc nunc et
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    a4-\solo a'2 g4
    f2 e4 a~
    a g f2
    e4 a2 g4
    f d e f
    d e a, a'
    g! f e e'
    c a f d'
  }
}

BassFigures = \figuremode {
  r4 <3> <2> <6>
  <7> <6> <7 _+> <3>
  <2> <6> <7> <6>
  <6 _+> <3> <4 2> <6 4\+>
  <6> <6 5> <7 _+> <5>
  <6 5> <_+>2.
  <6>4 <6\\> <4> <_+>
  <6>1
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
