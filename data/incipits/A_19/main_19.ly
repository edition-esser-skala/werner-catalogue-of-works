\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Jahel" b' r8 h h c16 d
  f,8 f f16 g as g es8 es r es'
  b b b c as as16 as as c b f
}

text = \lyricmode {
  Herr! darf ſich ei -- ne
  Magd zu dei -- ner Hülf er -- biet -- ten? So
  ße -- ze dein Ver -- trau -- en in mei -- ne ar -- me
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
