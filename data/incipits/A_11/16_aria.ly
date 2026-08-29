\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    r8 e' d c r f e d
    r g f e r a g f \gotoBar "19"
    e,4 d\trill c r
    r2 r8 e'16\p d c8 h
    a a'16 g f8 e d4 g,
    a8 h c d e fis g4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    r4 c'4. h16 c d4~
    d8 c16 d e4. a,8 d8. c16 \gotoBar "19"
    e,4 d c r
    R1
    r8 f'16\p e d8 c h c16 d e8 e,
    f g a h c4 d
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Presto"
    R1*2 \gotoBar "19"
    c4 h c r
    R1*3
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    R1*2 \gotoBar "19"
    r2 r4 c'
    h d c c,
    r a' h c
    f,4. f8 e4 r8 g
  }
}

SoliLyrics = \lyricmode {
  Er --
  öff -- ne dei -- nen,
  er -- öff -- ne
  dei -- nen Schlund du
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Presto"
    c2 d
    e f \gotoBar "19"
    g,2 c\p
    d e
    f2. e4
    d2 c4 h
  }
}

BassFigures = \figuremode {
  r2 <7>4 <6>
  <7> <6>2 <6>4
  <6 4>4 <5 3>2.
  <6>2 q
  r <4 2>4 <6>
  <7> <6>2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Gerecht."
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
