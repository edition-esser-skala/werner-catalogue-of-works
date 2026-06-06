\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Adagio"
  g'16.^\partVi b32 a16. c32 b16. d32 c16. es32 d16. f32 es16. g32 f16. as32 g16. b32
  \clef soprano \autoBeamOff h,2^\partSc c4 r
  c2 c4 r
  c2 h8 d d es
}

text = \lyricmode {
  \skips 16
  San -- ctus,
  san -- ctus,
  san -- ctus Do -- mi -- nus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
