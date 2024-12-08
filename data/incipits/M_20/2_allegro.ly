\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Allegro"
    r4 e'2 e,4
    c'8 h c4 a' d,~
    d d, h'8 a h4
    g'8 fis e d c h a16 h c8
    h a g16 a h8 e4 ais,
    h4. cis8 d cis d4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Allegro"
    R1*5
    r4 h'2 h,4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Allegro"
    e4. fis8 g fis g4
    e a fis r
    fis8 e fis4 d g
    e c'8 h a g fis e
    dis4 e8 d c2
    h r
  }
}

BassFigures = \figuremode {
  r2 <6>
  q q
  q q
  q2.. q8
  q <5>4 r8 <7>4 <6\\>
  <_+>1
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
