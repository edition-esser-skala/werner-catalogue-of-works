\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
  g4^\part "Adam" \tuplet 3/2 { es'8[ d c] } h[ d]
  c[ b16 as] g4 f
  es d r
}

text = \lyricmode {
  Hin -- weg mit
  al -- _ len
  Freu -- den
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
