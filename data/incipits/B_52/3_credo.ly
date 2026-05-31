\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    c'4^\solo f,8 f' d c16[ b] a[ b a b]
    c8 f, b16[ c] d8 c16[ d c b] a8 f'
    d b g[ f] e4 r
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li, coe --
  li et ter -- rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r4 d8^\solo e
    f8. f16 e8 a4 g8 f4
    e8 fis g4. f8 e[ a]
  }
}

AltoLyrics = \lyricmode {
  vi -- si -- %3
  bi -- li -- um o -- mni -- um
  et in -- vi -- si -- "bi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 g8^\solo a b8. b16
    a8 d4 c8 b4 a8 h
    c4. b8 a d4 c8
  }
}

TenoreLyrics = \lyricmode {
  vi -- si -- bi -- li -- %3
  um o -- mni -- um et in --
  vi -- si -- bi -- _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante"
    f,8-\solo g a f b c d c16 b
    a8 d g f e c f a,
    b4 h c8 a g4
    d' a' d,8 e f d
    c a g g' d4 a'8. g16
  }
}

BassFigures = \figuremode {
  r1
  <6>4. q8 q4. q8
  r4 q8 <5>4. <5>8 <6>
  r4 <4>8 <3> <6 5> <\t>4 <6!>8
  r <6\\> <4> <_-> <4> <3> <4> <3>
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
