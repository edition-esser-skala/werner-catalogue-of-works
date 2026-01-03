\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Judex" r8 f b b d \hA b
    g g r g g g h g
    e8. e16 e8 gis h e, d e
    c c r e a8. a16 e8 g
    f8. f16 f d f a b4 r16 g \hA b d,
  }
}

SoliLyrics = \lyricmode {
  Auf auf ihr Him -- mels
  Gei -- ſter! Be -- ge -- bet euch nun
  all -- zu -- gleich in al -- le Theil der
  Er -- den, ver -- sam -- blet ih -- re
  A -- ſchen -- ſtaub, da -- mit ſie ſchnell nach mein "Be -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b1
    h
    gis
    a2 cis
    d g,16 g' d b g4
  }
}

BassFigures = \figuremode {
  r1
  <6>
  q
  r2 q
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
