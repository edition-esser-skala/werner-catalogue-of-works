\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    e'1
    e2 f4. a8
    g2 g
    c, c
    c4 h c2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    g'1
    g4. c8 c2
    h c
    a2 c4 g
    f2 e
  }
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c4.^\solo d8 e4 e8 g
    c,4 c8 g' a4 a8 f
    d4 d8 c c8.[ d16] e[ g f e]
    a4 a16[ c h a] g8[ c,16 d] e[ g f e]
    f8[ d16 e] f[ g a h] c8[ c,16 h] c[ d e f]
  }
}

BassoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit, qui
  ve -- nit in no -- _
  _ _ _ _
  _ _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
    c1
    c2 f,~
    f e
    f e
    d' c
  }
}

BassFigures = \figuremode {
  r1
  r
  <4 2>2 <6>
  r <6>
  <7>4 <6>2.
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
