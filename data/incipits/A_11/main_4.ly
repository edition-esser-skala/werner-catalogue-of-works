\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Andante"
  \partial 8 d'8^\partVi g16 d b'8~ b16 g a fis g8 d~ d16[ b] \gotoBar "11"
  \clef soprano \autoBeamOff d8^\part "Barmherzigkheit"
  b g16[ a] b[ g] a[ fis] \hA \appoggiatura fis8 g4 r8 d'
}

text = \lyricmode {
  \skips #10
  Ô
  Menſch dich nicht be -- trüeb! dein
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
