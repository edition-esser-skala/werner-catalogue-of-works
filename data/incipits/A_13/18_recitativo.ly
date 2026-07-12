\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Gerechtigkeit" g c16 c c e h8 h h16 fis a h
    g8 g r16 g h g d'8. d16 d8 e
    f8. f16 f8 e c c r e
    e h h c d d d16 f e h
    c8 c16 c c e c g a8 a d16 d d c %5
  }
}

SoliLyrics = \lyricmode {
  Ge -- denck -- he dan ô Menſch was Gott vor dich muß
  ley -- den und du be -- gibſt dich pur auf
  lau -- ter Yeb -- big -- kei -- ten, al --
  lein diß laſt er nur auf ei -- ne Zeit paſ --
  sie -- ren al -- dorth wird er ſein Recht ſchon wiſ -- ſen auß -- "zu -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    e2 dis
    e h~
    h c!
    gis'1
    a4 e f2
  }
}

BassFigures = \figuremode {
  <6>2 q
  r <6>
  <6 5>1
  <6>2 <5>
  r4 <6> <5> <6>
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
