\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schöpffer" f, f16 f b f d8. d16 d8 es
    f f as g es8. es16 es8 g
    g g b a f f r d
    f f a c es,8. es16 es8 g
    f a c d b b r f
  }
}

SoliLyrics = \lyricmode {
  So wird dan mei -- ne Lieb und Treu von
  den Ge -- ſchö -- pffen oh -- ne Scheu mit
  Un -- danckh nur be -- loh -- net? Eß
  wolt ein ſtol -- tzer Lu -- ci -- fer auf
  mei -- nen Thron ſich ſchwin -- gen und
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b2 h~
    h c
    cis d
    a~ a
    a d
  }
}

BassFigures = \figuremode {
  r2 <6>
  <7- 5> <_->
  <7- 5>1
  <6>2 <5->
  <6> <6->
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
