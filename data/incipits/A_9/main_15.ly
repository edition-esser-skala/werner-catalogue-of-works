\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r8^\part "Judas" b b16 b es \hA b g8 h d16 d f es
  c8 g c16 c es c b8 f as16 as c b
  g8 g \clef alto r^\part "St: Michael" b es es g \hA es
}

text = \lyricmode {
  Ô daß doch di -- ſer Tag zu un -- ſern Troſt und
  Glickh in ei -- nen Au -- gen -- blickh ver -- wand -- let mö -- ge
  wer -- den! Nein nein, du ir -- reſt
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
