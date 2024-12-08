\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 6/8 \tempoMarkup "Allegro non troppo"
    r8 c'16 d es8 d g c,~
    c h es\p d g c,~
    c h as'\f g g, f'
    es16 f es d c8 d16( f) es d c h
    c d es f g a! b!8 b,16 c d es
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 6/8 \tempoMarkup "Allegro non troppo"
    R2.*4
    r4 r8 r g'16 a b8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 6/8 \tempoMarkup "Allegro non troppo"
    c4 c8~ c h as'
    g4 c,8~\p c h as'
    g4 f8\f es es' d
    c g as f g g,
    c c' b!16 a! g4 g,8
  }
}

BassFigures = \figuremode {
  r4. <5 2>8 r <6\\>
  <8 4> <\t _!>4 <5 2>8 r <6\\>
  <8 4> <\t _!> <_-> <6>4 <6!>8
  r2 <6 4>8 <5 _!>
  r4. <_->
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
