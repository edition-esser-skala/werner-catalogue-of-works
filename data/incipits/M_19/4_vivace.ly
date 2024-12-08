\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \dorian \time 3/4 \tempoMarkup "Vivace"
      \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    f'4 as4. g16 f
    g8 h, c g' as g16 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \dorian \time 3/4 \tempoMarkup "Vivace"
      \override Staff.TimeSignature.style = #'single-digit
    c'4 des4. c16 b
    c8 e, f c' des c16 b
    c8 e, f b as16 f g e
    f8 as16 g f8 es16 d! c8 d
    es g16 f es f es d c8 d
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \dorian \time 3/4 \tempoMarkup "Vivace"
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
