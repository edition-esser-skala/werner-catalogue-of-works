\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "St: Magdalena" c' c16 c e! c a8 a a16 g b a
    f8 r16 a d d f d c!8 g b16 b d c
    a4 r8 c a a a b
    c c c16 d es d b8 b r d
  }
}

SoliLyrics = \lyricmode {
  Nun khe -- re, mei -- ne Seel, ge -- tröſt in dei -- nen
  Leib, der einſt be -- ruef -- fen war als ein ver -- kher -- tes
  Weib, al -- lein die Reu und
  Bueß hat al -- le Sünd ver -- zeh -- ret, und
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    e!2 cis
    d e
    f fis~
    fis g
  }
}

BassFigures = \figuremode {
  <6>2 q
  r <6>
  r <6>
  r <_->
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
