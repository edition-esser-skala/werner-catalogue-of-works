\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Gerechtigkheit" r8 a a a f a
    a e r a g g b a
    f4 r8 f a a a c!
    c f, r f a a c a
    fis fis r d' b g d8. d16 %5
  }
}

SoliLyrics = \lyricmode {
  Weil ich kein Macht nun
  ha -- be al -- hier in di -- ſer
  Zeit, ſo wil ich dan jezt
  har -- ren, mein Rach ſo lang ver --
  ſpa -- ren biß in die E -- "wig -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d1
    cis
    d
    a
    d2 g,4 d'
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <6>
  <_+>2 <_->4 <4>8 <_+>
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
