\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    \once \override Staff.TimeSignature.style = #'single-digit
  a'4.^\partBc a16[ gis] a8[ h]
  \clef tenor e4.^\partTc d16[ cis] d8[ e]
  \clef alto a4.^\partAc a16[ gis] a8[ h]
  \clef soprano e4.^\partSc d16[ cis] d8[ e]
}

text = \lyricmode {
  San -- _ _
  San -- _ _
  San -- _ _
  San -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
