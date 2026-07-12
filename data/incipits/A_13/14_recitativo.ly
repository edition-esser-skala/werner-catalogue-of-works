\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schöpffer" f, f16 f b f d8. d16 d8 f
    as8. as16 as8 g e! e16 e g g g a
    b8. b16 b8 g e e g f
    d d r f\f b f f d
    h! d f16 f g d es8 es r16 c' h! c
  }
}

SoliLyrics = \lyricmode {
  Weil dan mein ein -- ge -- bohr -- ner Sohn daß
  menſch -- li -- che Ver -- bre -- chen an ih -- me ſelbſt frey --
  wil -- lig -- lich auß Lieb will laſ -- ſen
  rä -- chen. So hör nun je -- der --
  man mit Züt -- tern und Er -- ſtau -- nen daß grech -- te
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 h!~
    h cis~
    cis1
    d2 b
    g fis
  }
}

BassFigures = \figuremode {
  <6->2 <6>
  <7- 5> <6>
  <7- 5>1
  r
  <7 _!>2 <7- 5>
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
