\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "ardito"^\markup \remark "Sisera" g d'16 d h! g es'8 c b16 b d \hA b
    g8 g r16 b b c des8. des16 des8 b
    g' e! des c as as r c
    f f, f e! g4 r
    r8 as c16 c es c a4 r
  }
}

SoliLyrics = \lyricmode {
  Und Ta -- bor ist be -- dekt mit ze -- hen -- tau -- ſend
  Knech -- ten des fre -- hen Is -- ra -- els, die
  wi -- der mich zu fech -- ten der
  Kün -- heits Kü -- zel treibt.
  Wohl -- an Ver -- weg -- ne bleibt;
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    h!2 c4 d
    es2 e~
    e f
    des c4. es8
    as,2 f8 f' f f
  }
}

BassFigures = \figuremode {
  r2 <_->4 <6->
  r2 <7- 5>
  r <_->
  <7>4 <6!> <_!> <6- _->4
  r2 <_!>
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
