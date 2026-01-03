\version "2.24.2"
\include "header.ly"

Trombone = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c1
    R1*4
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1
    r8^\part "St: Michael" c g'16 g g as f8 f16 f f f as g
    es8 es \clef tenor r^\part "St: Petrus" c a c es d
    b r16 \hA b d8 \hA b g4 r8 fis
    a a r4 \fC r8^\markup \remark "ardito" ^\part "Lucifer" f b16 b c d
  }
}

SoliLyrics = \lyricmode {
  Woll -- an, die Zeit bricht an, ihr ſolt vor Ge -- rich -- te
  ge -- hen. Ô ü -- ber -- bitt -- re
  Forcht, wie werd ich da be --
  ſte -- hen! Ô Gott der du "ge -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1
    e!2 f4 h,!
    c2 fis
    g4 d es2
    d4 d8 f! b,2
  }
}

BassFigures = \figuremode {
  r1
  <6>2 <_->4 <7- 5>
  <_->2 <7- 5>
  <_->4 <6- _+> <7> <6\\>
  <_+> <6 _!>2.
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "t-trb"
      \Trombone
    }
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
