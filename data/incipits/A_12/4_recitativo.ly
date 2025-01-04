\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Jobs Frau" r8 g' c c e c
    a r16 a a a a d cis8. cis16 cis8 e
    g, g b a f8. f16 f8 a
    fis a c! b \grace a g4 r8 d'
    gis,8. gis16 h8 d, e e \clef tenor r^\part Job a,
  }
}

SoliLyrics = \lyricmode {
  Be -- glückht biſ -- tu mein
  Job! Und wirſt auch ſtets ge -- ſeg -- net ſein ſambt
  mir und al -- len Kün -- dn dein, ſo --
  lang als Got -- tes Lob in
  dei -- nen Mund er -- ſchal -- let. Mit
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    e1
    f2 e
    cis d
    c b
    h a
  }
}

BassFigures = \figuremode {
  <6>1
  r2 <6\\>
  <5>1
  <4\+ 2>2 <6>
  <6\\> <_+>
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
