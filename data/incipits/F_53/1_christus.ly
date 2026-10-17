\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'1. c2
    a a1 a2
    a gis a1
    r2 a h h
    c1. h4 a
    h1 c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    e1. e2
    f f1 e2
    f e4 d e2 e
    f1 d2 g~
    g f4 e d1~
    d e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g'1. c2
    a a1 a2
    a gis a1
    r2 a h h
    c1. h4 a
    h1 c
  }
}

SopranoLyrics = \lyricmode {
  Chri -- stus
  na -- tus est
  no -- _ bis,
  na -- tus est
  no -- _ _
  _ bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    e1. e2
    f f1 e2
    f e4 d e2 e
    f1 d2 g~
    g f4 e d1~
    d e
  }
}

AltoLyrics = \lyricmode {
  Chri -- stus
  na -- tus est
  no -- _ _ bis, na --
  tus est, na --
  tus est no --
  bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1 c
    c c2 cis
    d h cis cis
    d1 h2 d
    g, g g1~
    g g
  }
}

TenoreLyrics = \lyricmode {
  Chri -- stus
  na -- tus est
  no -- _ bis, na --
  tus est, na --
  tus est no --
  bis.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1. c2
    f1 f2 a
    d,1 a
    r2 d g g
    e d4 c g'1
    g, c
  }
}

BassoLyrics = \lyricmode {
  Chri -- stus
  na -- tus est
  no -- bis,
  na -- tus est
  no -- _ _ _
  _ bis.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1. c2
    f1 f2 a
    d,1 a
    r2 d g g
    e d4 c g'1
    g, c
  }
}

BassFigures = \figuremode {
  r\breve
  r1. <_+>2
  <3> <6 4\+> <_+>1
  r\breve
  <6>1 <4>
  <3>\breve
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
