\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "Tempo di bon gusto"
    a''8 a,16 a a8 a a4 a a16 h c h a[ h c d]
    e8 e,16 e e8 e e4 e e16 fis gis \hA fis e[ \hA fis \hA gis e]
    a8 a,16 a a8 a a4 a a16 h c h a[ h c d]
    e8 e'16 e e8 e, e16 e e e e[ e e e] e4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "Tempo di bon gusto"
    a''8 a,16 a a8 a a4 a a16 h c h a[ h c d]
    e8 e,16 e e8 e e4 e e16 fis gis \hA fis e[ \hA fis \hA gis e]
    a8 a,16 a a8 a a4 a a16 h c h a[ h c d]
    e8 e'16 e e8 e, e16 e e e e[ e e e] e4 r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "Tempo di bon gusto"
    a'8 a,16 a a8 a a4 a a16 h c h a[ h c d]
    e8 e,16 e e8 e e4 e' e16 fis gis \hA fis e[ \hA fis \hA gis e]
    a8 a,16 a a8 a a4 a a16 h c h a[ h c d]
    e8 e'16 e e8 e, e16 e e e e[ e e e] e fis gis \hA fis e[ \hA fis \hA gis e]
  }
}

BassFigures = \figuremode {
  %tacet
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
