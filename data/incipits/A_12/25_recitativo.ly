\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part Schöpffer e, e16 e g a f8 f f16 a f c
    d8 d r fis a a c h
    g g r h dis, fis a g
    e e a16 a c e, fis8 fis16 fis fis8 h
    g8. g16 g8 h e, gis h c
  }
}

SoliLyrics = \lyricmode {
  Weill du dem -- nach, mein Job, er -- tuld ſo bitt -- re
  Schmer -- tzen, und doch in dei -- nen
  Her -- tzen nie -- mahl von mei -- nen
  Lob dich pfleg -- teſt ab -- zu -- wen -- den, ſo ſol -- ſtu
  auch hin -- führ von mei -- nen mil -- den
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    a2 a
    fis1
    g2 fis
    e4 c' h2~
    h gis
  }
}

BassFigures = \figuremode {
  <_+>2 <6 _!>
  <6>1
  r2 <6\\>
  r4 <6> <_+>2
  <6> <6>
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
