\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4 r8 g b8. b16 b8 d
    d8. a16 a8 a h8. h16 d8 es
    c4 r8 g b8. b16 c8 g
    a8. a16 a8 cis e cis a g
  }
}

SoliLyrics = \lyricmode {
  Ick gom auß die Sa --
  vo -- ier Länd mit ſö -- ner Ra -- ri --
  tè die Spil -- li -- werg bel --
  lè gal -- lant will ſi vor Creu -- tzer
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2~ g
    fis f
    es e
    cis cis
  }
}

BassFigures = \figuremode {
  <_->1
  r2 <4! 2>
  <6> <6 5>
  <6>2 q
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Savoiard"
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
