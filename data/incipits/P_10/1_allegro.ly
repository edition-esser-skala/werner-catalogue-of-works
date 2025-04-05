\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    f'4 f~
    f16 e f8~ f e
    f16 e f8~ f e
    f f, r4
    e' e~
    e16 d e8~ e d
    e16 d e8~ e d
    e e, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    a'4 a~
    a16 g a8~ a g
    a16 g a8~ a g
    a a, r4
    g' c~
    c16 h c8~ c \hA h
    c16 h c8~ c \hA h
    c c, r4
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    c4 r
    r8 c4 e8
    c a c e
    c4 r
    e r
    r8 g4 g,8
    g'4 g
    g r
  }
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    f4 r
    r8 f a c
    a f a c
    f,4 r
    c r
    r8 c e g
    e c e g
    c,4 r
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  r
  r4. <_!>8
  r4. <_!>8
  r2
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
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
