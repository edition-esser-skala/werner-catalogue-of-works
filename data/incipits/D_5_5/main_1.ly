\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Allegro"
  b''8^\partVi b, r16 b32 c d16 f \grace a8 g8.\trill f32 es f8 b, \gotoBar "10"
  \clef bass \autoBeamOff b,8^\partBs b,16 b r8 f' b a16 g f8 es16 f
  d8 b r4 r r8 f'16 f
  b8 b, r4 r r8 b16 b
}

text = \lyricmode {
  \repeat unfold 11 { \skip 8 }
  Fu -- ri -- ae vos di -- vae a -- bys -- si vo -- %10
  la -- te, pro -- pe --
  ra -- te, pro -- "pe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
