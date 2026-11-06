\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    g'16.^\part "Barthlme" g32 g16 g g8 h16 g e4 r8 g
    g g c g a8. e16 e8 a16 e
    f8 f a b c! r c16 a f a
    d,8. d16 d8 \clef tenor d'^\part "Schullmeiſter" fis,8. fis16 a8 c
  }
}

SoliLyrics = \lyricmode {
  Bakts önk mit dem Schwä -- wer -- le -- gaun könts
  ja umb oä -- nen an -- dern ſchaun, wiſts denn
  nit daß dSup -- pen Schwabn müſ -- ſen s’löz -- ti
  Wort all habn. Herr Bar -- thl -- me  hat
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    h2 c
    c cis
    d a
    b a
  }
}

BassFigures = \figuremode {
  <6>1
  r2 q
  r <6 [_!]>
  r <6\\>
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
