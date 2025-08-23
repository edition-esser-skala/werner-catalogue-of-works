\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  f'4.^\partSs e8 d[ c!16 b]
  a8[ g] f4 e\trill
  d r r
}

text = \lyricmode {
  Ky -- ri -- e __
  e -- lei -- _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
