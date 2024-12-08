\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/8 \tempoMarkup "Allegro"
    d'8. e16 f g
    e8 a,16 h c! a
    d8 g,16 a b g
    cis a h cis d8
    d,16 e f8 e
    d16 e f g a h!
    c!8 a a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/8 \tempoMarkup "Allegro"
    R4.*6
    a'8.\fE h16 c d
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/8 \tempoMarkup "Allegro"
    r8 d d'
    cis c c,
    h' b b,
    a' g f
    g a a,
    d c! h!
    a4 r8
  }
}

BassFigures = \figuremode {
  r4.
  <6>8 <\t>4
  <7>8 <6>4
  <_+> <6>8
  <_-> <6 4> <5 _+>
  r <6> <6\\>
  r4.
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
