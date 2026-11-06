\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 12/8 \tempoMarkup "[no tempo]"
    g16\f a h a g8 d'16 e fis e d8 g16 a h a g8 d'8.\trill e32( fis) g8 \gotoBar "7"
    g, d h g4 r8 r4 r8 d'16\p e fis e d8
    g16 a h a g8 g'4 r8 r4 r8 a,16 h c h a8
    h16 c d c h8 h,16 c d c h8 r2*3/2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 12/8 \tempoMarkup "[no tempo]"
    g16\f a h a g8 d'16 e fis e d8 g16 a h a g8 d'8.\trill e32( fis) g8 \gotoBar "7"
    h, g d h4 r8 r4 r8 d16\p e fis e d8
    g16 a h a g8 g'4 r8 r4 r8 fis,16 g a g fis8
    g16 a h a g8 g,16 a h a g8 r2*3/2
  }
}

Soli = {
  \relative c {
    \clef bass
    \key g \major \time 12/8 \autoBeamOff \tempoMarkup "[no tempo]"
    R1. \gotoBar "7"
    r2*3/2 g'8 h16([ a g8)] d'4 d,8
    g4 g,8 g4 r8 a' c16([ h a8)] fis a16([ g fis8)]
    g[ d] h g4 r8 g'[ a] h h[ a] g
  }
}

SoliLyrics = \lyricmode {
  I mit mein Ver --
  ſtands Maß -- Stab möſ -- ſe __ al -- le __
  Män -- gl ab mi ſoll koä -- ner
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 12/8 \tempoMarkup "[no tempo]"
    g'8 g g fis fis fis e e e h h h \gotoBar "7"
    g4 r8 g h d g4 r8 fis16 e d e fis8
    e d c h16 a g a h8 c4 r8 d4 r8
    g d h g4 r8 g'4.~ g8 fis e
  }
}

BassFigures = \figuremode {
  r1.
  r
  r2. <6>
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
        \set Staff.instrumentName = "Barthlme"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
