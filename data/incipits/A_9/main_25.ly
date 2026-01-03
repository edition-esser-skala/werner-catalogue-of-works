\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Andante passato"
  g''4~^\partVi g16 c, a' c, \appoggiatura c8 h4 c8 \tuplet 3/2 8 { c16 d e }
  f( e) f8 d' f, f16([ e)] \gotoBar "9"
    \clef soprano \autoBeamOff
    g,8^\part "St: Magdalena" \tuplet 3/2 8 { c16[ d e] } d[ c]
  h8 c d16[ h] g[ f] e8 f g c
}

text = \lyricmode {
  \skips 14
  Ô süeſ -- ſe
  Lieb, troſt -- rei -- che Bueß, wie ha -- ſtu
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
