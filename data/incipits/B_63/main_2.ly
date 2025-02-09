\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1^\partSc d
  c2 a d d
  d cis d d
  h g c2. h4
}

text = \lyricmode {
  Pa -- _
  trem o -- mni -- po --
  ten -- _ tem, fa --
  cto -- rem "coe -" _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
