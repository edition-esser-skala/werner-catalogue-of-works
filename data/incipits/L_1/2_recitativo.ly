\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 d f a a16 e e e g8 a16 e
    f8 r16 d d d d e fis8 fis a16 a c b
    g8 d g16 g b g a4 a,8. a16
    d4 r r2
  }
}

SoliLyrics = \lyricmode {
  Mei ſchö -- ni Kunſt hat Ar -- chi -- me -- des er --
  denckt und hätt ſi beym Stu -- dirn döß Werckh recht aus -- zu --
  führn ſchier bald an ei -- ner Brad -- wurſt er --
  henckt.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 cis
    d c
    b a
    d16. d'32 b16. g32 a8 a, d4 r
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>
  r
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Sagfäller"
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
