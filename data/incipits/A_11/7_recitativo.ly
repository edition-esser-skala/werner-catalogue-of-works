\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Der verlohrene Sohn" r8 c f f a f
    es es r \hA es es es g \hA es
    d d r d d d a h
    c c r c es es es d
    b4 \clef soprano r8^\part "Barmherzigkheit" d' d8. g,16 g8 a
  }
}

SoliLyrics = \lyricmode {
  O Him -- mel wie waß
  hör ich, ſo bin ich dan ver --
  ſtoſ -- ſen, und gäntz -- lich auß -- ge --
  ſchloſ -- ſen auß mei -- nes Vat -- ters
  Gnad! Ver -- za -- ge nicht, weil %5
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f1
    g
    fis
    fis
    g
  }
}

BassFigures = \figuremode {
  r1
  <6->
  r
  r
  <_->
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
