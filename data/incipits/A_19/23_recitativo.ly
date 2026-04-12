\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
    r8^\markup \remark "Jahel" d' g d es8. es16 es8 g
    c, g g a b b b16 b c g
    a8 a r16 a cis e f8. f16 f8 d
    c g b c a4 r8 c
    a a c d b b16 b b b d \hA b
  }
}

SoliLyrics = \lyricmode {
  Mein Herr wie den -- keſt du ſo
  vor -- theil -- hafft und guet vor mei -- ne Ohn -- machts --
  kräff -- ten, ſchreib doch daß Lor -- ber -- recht dem
  äch -- ten Sie -- ger zu, der
  Na -- gel und der Ham -- mer die ihn an Bo -- den
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    h!2 c
    e! e
    cis d
    e f8-! c-! a-! f-!
    fis'2 d
  }
}

BassFigures = \figuremode {
  r2 <_->
  <6> <5->
  <6>1
  <6>
  <6>2 <6->
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
