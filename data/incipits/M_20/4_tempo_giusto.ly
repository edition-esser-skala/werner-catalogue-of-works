\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Tempo giusto"
      \override Staff.TimeSignature.style = #'single-digit
    r4 r e'
    dis8 h d d d c16 h
    c4 r a'
    gis8 e g g g fis16 e
    fis8 d f f f e16 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Tempo giusto"
      \override Staff.TimeSignature.style = #'single-digit
    r8 e' e, fis g a
    h4 fis gis
    r8 a' a, h c d
    e4 h cis
    d a h
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Tempo giusto"
      \override Staff.TimeSignature.style = #'single-digit
    R2.*5
  }
}

BassFigures = \figuremode {
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
