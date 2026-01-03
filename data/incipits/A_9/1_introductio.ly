\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    R1
    r2 r4 g''~
    g fis f es~
    es8 es d c h a16 \hA h c8 c,~
    c d es f16 g f8 d' d16 c d8
    g,4 r r c'~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    r4 c'2 h4
    b as2 g8 a16 h
    c8 es d c h d c b
    as4. as8 g2
    r4 c2 h4
    c8 g c4. d8 es f16 g
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    r2 f4. f8
    e g f es d f es d
    c4 as' d, g
    c,2 d4 g,~
    g r r f'~
    f e es2
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    c2 d
    c4 f b, es
    as,2 g4 r
    r f'2 e4
    es2 d
    c r
  }
}

BassFigures = \figuremode {
  r2 <7>4 <6!>
  <7- _!> <_-> <7>2
  <7>4 <6\\> <7! _!>2
  r4 <6 _->8 <5 \t> <6 4! 2>4 <6>
  q2 <7>4 <6!>
  <4> <_!>2.
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
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
