\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 a'
    a2 g a e
    f1 e2 a~
    a g r a
    d b f'1
  }
}

SopranoLyrics = \lyricmode {
  Pa --
  trem o -- mni -- po --
  ten -- tem cre --
  do, fa --
  cto -- rem "coe -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 d
    d2 c d a
    b1 a2 a'~
    a f r1
    r2 d a' f
    b1 a2 a
  }
}

AltoLyrics = \lyricmode {
  Pa --
  trem o -- mni -- po --
  ten -- tem cre --
  do,
  fa -- cto -- rem
  coe -- li et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a1 a2 g
    a e f c'
    d1. cis2
    d1 r2 a
    d b f'1
    b,2 b c f,
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem,
  cre -- _
  do, fa --
  cto -- rem coe --
  li et ter -- rae,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1 d2 c
    d a b1
    a r
    R\breve
    r2 d a' f
    b1 a2 a
    g1 f
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem,

  fa -- cto -- rem
  coe -- li et
  ter -- rae,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d1-! d2-! c-!
    << { a'1 } \\ { d,2 a } >> b1
    a \clef tenor f'2 a
    b1 a
    \clef bass r2 d, a' f
    b1 a
    g f
  }
}

BassFigures = \figuremode {
  r\breve
  r1 <3 7>2 <_ 6>
  <4> <_!> <6> <_!>
  <7> <6> <4> <_+>
  r1 <5>
  <7>2 <6> q1
  <5>\breve
}

\score {
  <<
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
