\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partAs h' a g8([ fis)] e4 fis8([ g)]
  \clef soprano fis4^\partSs h h h8 h h[ e] d![ c]
  h4 g g fis g h
}

text = \lyricmode {
  In con -- ver -- ten -- do
  Tunc re -- ple -- tum est gau -- di --
  o os no -- _ strum, et
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
