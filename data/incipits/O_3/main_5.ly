\version "2.24.2"
\include "header.ly"

#(add-simple-time-signature-style 'rotCC
   (lambda (fraction)
     (make-line-markup
       (list
         (make-rotate-markup 180 (make-musicglyph-markup "timesig.C44"))
         (make-musicglyph-markup "timesig.C44")))))

notes = \relative c' {
  \clef treble
  \twofourtime \key g \minor \time 2/4 \tempoMarkup "Allegro"
    \override Score.TimeSignature.style = #'rotCC
  g'8^\partVi es' d d,
  g4 g'
  es8 d16 c b8 a
  b a g4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
