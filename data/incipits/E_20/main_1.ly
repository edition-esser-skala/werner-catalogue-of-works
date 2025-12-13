\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Andante moderato"
  g'4.^\partVii a16 fis g4. a16 fis
  g8 \tuplet 3/2 8 { a16 h c } h8 a16 h c8 h e g, \gotoBar "9"
  \clef tenor \autoBeamOff g,4.^\partTs a16[ fis] g8 c h e
  d h16[ a] g8 \tuplet 3/2 8 { a16[ h c] } h8 a16[ h] c8 h
}

text = \lyricmode {
  \skips 17
  O Ma -- ri -- a hilff mir käm -- pfen
  und die bö -- ße Ney -- gung däm -- pfen,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
