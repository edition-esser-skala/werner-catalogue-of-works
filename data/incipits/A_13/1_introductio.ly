\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagiose"
    R1
    r4 d'2 c!4
    b2\trill a4 a'~
    a g8 f e4 c'~
    c b!8 a gis4 a~
    a a2 g4\p
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagiose"
    r4 a'2 g4
    f2\trill e4 a~
    a g2 f4
    r b'2 a8 g
    fis4 d'2 c4~
    c c h\p b
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagiose"
    r2 r4 e~
    e d e4. e8
    f4 g c,4. c8
    d4. d8 g,4 e'
    a, fis' h, a
    e' fis2 e4\p
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagiose"
    d2 cis
    d a4 a'
    d, e f2
    b, c
    d e4 f
    e dis e2\p
  }
}

BassFigures = \figuremode {
  r2 <6>4 <5>
  <9> <8> <4> <_!>
  <6 5> <5> <9> <8>
  <7> <6>8 <5> <7>4 <6>8 <5>
  <7! _+>4 \bassFigureExtendersOn <6 _+>8 <5 _+> \bassFigureExtendersOff <7 _+>4 <5>
  <6 4> <7 5> <9 5! 4> <8 5- 3>
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
