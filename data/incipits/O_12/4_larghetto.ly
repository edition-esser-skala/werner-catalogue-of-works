\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Larghetto e sempre piano"
    c4. c16( d) d2
    e16( g) b( d) e( g) b( b,) \grace b8 a2
    a16( c) es( fis) a( \hA fis) \hA es( c) b2
    as16(-. as-. as-. as-.) as(-. as-. as-. as-.) g(-. g-. g-. g-.) g(-. g-. g-. g-.)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Larghetto e sempre piano"
    a4. a16( b) b2
    g4 r r16 c(-. c-. c-.) c(-. c-. c-. c-.)
    c4 r r16 d(-. d-. d-.) d(-. d-. d-. d-.)
    h(-. h-. h-. h-.) h(-. h-. h-. h-.) c(-. c-. c-. c-.) c(-. c-. c-. c-.)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Larghetto e sempre piano"
    f16(-. f-. f-. f-.) f(-. f-. f-. f-.) f(-. f-. f-. f-.) f(-. f-. f-. f-.)
    f4 r f16(-. f-. f-. f-.) f(-. f-. f-. f-.)
    fis4 r g16(-. g-. g-. g-.) g(-. g-. g-. g-.)
    f!(-. f-. f-. f-.) f(-. f-. f-. f-.) es(-. es-. es-. es-.) es(-. es-. es-. es-.)
  }
}

BassFigures = \figuremode {
  r2 <6 4>
  <7 4 2> <8 3>
  <7- 5 3>1
  <4! _->2 <6>
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
