\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Mazko" g' g16 g c g a8. e16 e8 e16 fis
    g8 g a e fis r fis16 g a fis
    g8. d16 d4 r8 e16 gis h gis e d
    c8 e16 e a8 c g8. d16 d d d e
  }
}

SoliLyrics = \lyricmode {
  Herr Rich -- tär ha -- mär ſcharf -- fe Klagn wi -- der
  Par -- thl vor -- zu -- tragn, Schwabn -- würth mus Vor --
  ſprö -- cher ſey, der woäß auß der Stu -- di
  fei, wie mär Sa -- chä her ci -- tirt und ſo än
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    e2 cis
    cis d
    h gis
    a h~
  }
}

BassFigures = \figuremode {
  <6>2 q
  <5> <_+>
  <6> q
  r1
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
