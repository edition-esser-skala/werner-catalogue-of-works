\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Largo"
      \override Staff.TimeSignature.style = #'single-digit
    g'4 a r8 r16 gis
    a4 a, r
    c' d r8 r16 cis
    d4 d, r8 r16 d'
    dis4 dis, r8 r16 dis'
    e4 e, r8 r16 fis'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Largo"
      \override Staff.TimeSignature.style = #'single-digit
    e4 fis r8 r16 f
    e4 e r
    a h r8 r16 b
    a4 a r8 r16 a
    a4 fis'! r8 r16 a,
    a4 g! r8 r16 h
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Largo"
      \override Staff.TimeSignature.style = #'single-digit
    e'4 dis r8 r16 d
    c4 c r
    a gis r8 r16 g
    f4 f r8 r16 f
    fis4 fis r8 r16 fis
    e4 e r8 r16 d!
  }
}

BassFigures = \figuremode {
  r4 <5 3>4.. <4+ _!>16
  <6>2. %100
  r4 <5 3>4.. <4+ _->16
  <6>2 r8. <\t>16
  <6\\>2 r8. <\t>16
  <4>4 <_!>4.. <6>16
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
