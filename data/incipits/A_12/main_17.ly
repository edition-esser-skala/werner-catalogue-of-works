\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 6/8 \tempoMarkup "Largo"
  d'4^\part "ob" a8 f'8. e16 d8
  b!8. a16 gis8 \hA \grace gis a4 r8 \gotoBar "13"
  \clef tenor \autoBeamOff d,4^\part "Job" a8 f'8.[ e16] d8
  b!8.[ a16] gis8 \hA \grace gis a4 r8
}

text = \lyricmode {
  \skips 9
  Leicht -- lich iſt __ ge --
  dul -- dig ſeyn,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
