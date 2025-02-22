\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    R1.*6 %6
    r2 r r4 e'~
    e a, a'4. g8 f e \hA f4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    R1.*7 %7
    r4 a'2 d,8 e f g a h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    d'2^\solo h4 g a d
    c2 h r4 d
    e d cis2 d4 c
    h8[ c a h] c2. h4
    c2 r r
    R1.*3
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa --
  cto -- rem coe -- li et
  ter -- _ _
  rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*3
    r2 c4^\solo g' f4. f8
    e4 a2 g4 f2
    e4 c d e f2~
    f4 e2 d4 e2
    R1.
  }
}

AltoLyrics = \lyricmode {
  Vi -- si -- bi -- li --
  um o -- mni -- um
  et in -- vi -- si -- bi --
  _ li -- um.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*3
    r2 r a4^\solo d
    c4. c8 h4 e2 d4
    c2 h4 g a h
    c4. h8 a4 a gis2
    R1.
  }
}

TenoreLyrics = \lyricmode {
  Vi -- si --
  bi -- li -- um o -- mni --
  um et in -- vi -- si --
  bi -- _ _ li -- um.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    r2 g'^\solo fis4 d
    e a g2 fis
    r4 g a g fis2
    g4 f e d8[ c] d2
    a r r
    R1.
    r2 a'4 a h e,
    c'4. h8 a[ g f e] d4. d8
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem,
  fa -- cto -- rem coe --
  li et ter -- _ _
  rae,

  Et in u -- num
  Do -- _ _ _ "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g2-\solo g' fis4 d
    e a g2 fis
    r4 g a g fis2
    g4 f e d8 c d2
    a e' a4 h
    c2 g d
    a'4. g8 f2 e
    a4. g8 f4. e8 d2
  }
}

BassFigures = \figuremode {
  r1.
  <6>
  r2 <_+> <6>4 <5!>
  r2 <6>1
  r2 <4>4 <3> <6! 5> <\t 3>
  r2 <5>4 <6> <5 _!> <6 \t>
  <6!> <5>8 <[6]> <7>4 <6> <_+>2
  r1.
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
