\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Vivace"
  g''8^\markup \remark "vl solo" d g a16 b a8 b16 c \sbOn fis,( g) g16.\trill fis64( g) \sbOff
  a8 d, r d'16( c) c( b) b( a) a( g) g( f) \gotoBar "18"
  \clef alto \autoBeamOff g,8^\partAs d g a16[ b] a8 b16[ c] fis,8 g
}

text = \lyricmode {
  \skips 18
  E -- ia, e -- ia er -- go, ad -- "vo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
