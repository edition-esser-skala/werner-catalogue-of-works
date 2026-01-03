\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Judas" b b16 b es \hA b g8 h d16 d f es
    c8 g c16 c es c b8 f as16 as c b
    g8 g \clef alto r^\part "St: Michael" b es es g \hA es
    c e g16 g b as f8 f r as
    as8. es16 es8 c f8. f16 f8 a
  }
}

SoliLyrics = \lyricmode {
  Ô daß doch di -- ſer Tag zu un -- ſern Troſt und
  Glickh in ei -- nen Au -- gen -- blickh ver -- wand -- let mö -- ge
  wer -- den! Nein nein, du ir -- reſt
  weith ſambt dei -- nen Mit -- ge -- ferd -- ten, hat
  Jo -- su -- e durch ſein Be -- fehl die
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    es2 h!
    c d
    es g
    e f
    c a!
  }
}

BassFigures = \figuremode {
  r2 <6>
  <_-> <6->
  r <6->
  <6> <_->
  <6-> <6>
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
