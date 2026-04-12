\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "Jahel" g' c e h8. h16 h8 c
    d d f e c c c d
    e8. a,16 a8 cis e g f e
    f4 r8 f c8. c16 g8 a
    b b b16 d c g a8 a r f'
  }
}

SoliLyrics = \lyricmode {
  Be -- glük -- tes Is -- ra -- el! Ich
  hab im Geiſt ge -- ſehn dein ſcharf -- fes
  Hel -- den -- ſchwerd auf Lor -- ber -- ä -- ſten
  ſtehn, und hat dein Sie -- ges --
  recht mit Glük ver -- eint ge -- ſtrit -- ten, ſo
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c2 d
    h e
    cis1
    d2 e~
    e f4 a,
  }
}

BassFigures = \figuremode {
  r2 <6>
  r q
  q1
  r2 <6>
  <5->2. <6>4
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
