\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\markup \remark "Jahel" b' r8 h h c16 d
    f,8 f f16 g as g es8 es r es'
    b b b c as as16 as as c b f
    g8 g r16 g b c des8. des16 des8 b
    b b b c a! a16 a cis8 e
  }
}

SoliLyrics = \lyricmode {
  Herr! darf ſich ei -- ne
  Magd zu dei -- ner Hülf er -- biet -- ten? So
  ße -- ze dein Ver -- trau -- en in mei -- ne ar -- me
  Hüt -- ten; ſo -- wohl die blei -- che Farb, alß
  dein ver -- wüerk -- tes Wee -- ßen laßt mich die
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    es2 d
    h! c
    d d
    es e~
    e cis
  }
}

BassFigures = \figuremode {
  r2 <6!>
  <5> <_->
  <6-> <5->
  r <7->
  r <6>
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
