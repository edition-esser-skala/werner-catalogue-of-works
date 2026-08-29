\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Der verlohrene Sohn" d d8 d d es
    c4 r8 c c es d a
    b b r \hA b b b b c
    d4 r8 d f f f es
    c4 r8 c c c c g
  }
}

SoliLyrics = \lyricmode {
  Wo wend ich mich nun
  hin! die Noth hat mich umb --
  ge -- ben, ich bin von al -- ler
  Weld ver -- laſ -- ſen, und ver --
  acht, weil durch ver -- kher -- ten
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'1
    fis
    g
    f!
    es
  }
}

BassFigures = \figuremode {
  r1
  <7->
  <_->
  <4! _->
  <6>
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
}
