\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]" \autoBeamOff
  r4^\partBs c'8 g es c as' c,
  c h g'8. f16 es8 c' b8. as16
  g[ as] g[ \hA as] b8 b, c c' d,8. es16
}

text = \lyricmode {
  Al -- le Weld iſt nun be --
  tran -- get, an dem Joch der Ar -- mueth
  han -- get, wer hilfft wohl auß di -- ßer
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
