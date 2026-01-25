\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  c'8^\partSc a16[ b] c8 d c b16[ a] b8. b16
  a4 r8 c c16[ d] c[ d] c[ d] c[ d]
  c8 f, r d' d16[ es] d[ \hA es] d[ \hA es] d[ \hA es]
}

text = \lyricmode {
  Con -- fi -- te -- bor ti -- bi, Do -- mi --
  ne, in to -- to cor -- de
  me -- o, in to -- to cor -- de
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
