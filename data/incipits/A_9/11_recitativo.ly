\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Lucifer" b es16 es \hA b g c8 c c16 c g as
    b8 b16 b b des c g as4 r16 \hA as as c
    es8. as,16 as8 as c c es des
    b b r16 \hA b des \hA b b8. f16 f4
    \fC r8^\markup \remark "furioso"^\part "Judas" h d16 d f es c8 c c16 c c d
  }
}

SoliLyrics = \lyricmode {
  Steh auf, du Höl -- len -- braud! du ſol -- leſt nun er --
  ſchei -- nen vor Gött -- li -- chen Ge -- richt, zu dei -- ner
  größ -- ten Schand wir -- ſtu mit al -- len
  Pey -- nen nun -- meh -- ro wohl ge -- zücht.
  Ver -- flue -- chte Schlan -- gen -- brueth, ſoll ich dich nun "be -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    es2 e~
    e f
    c a!
    b4 e! f f,
    d'!2 es
  }
}

BassFigures = \figuremode {
  r2 <6>
  <5-> <_->
  <6- [_-]> <7- 5->
  <_->4 <7- 5[-]> <4[-]> <3>
  <6!>2 <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { }
}
