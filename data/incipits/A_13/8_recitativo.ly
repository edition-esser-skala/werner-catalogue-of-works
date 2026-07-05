\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    d8^\markup \remark "lamentuoso" ^\part "Adam" r16 d d8 h16 d d8 gis, r h
    c8. c16 c8 h gis8. gis16 gis8 f'
    e c ais8. h16 h8 h16 \clef soprano fis'^\part "Barmherzigkeit" h8 h
    d!8. g,16 g8 h e, e e fis
    gis8. gis16 gis8 h h d c h %5
  }
}

SoliLyrics = \lyricmode {
  Ach! ſo muß ich dan ſter -- ben? und
  e -- wig -- lich ô Her -- tzens -- ſtich! in
  grö -- ſten Leyd ver -- der -- ben? Halt ein ver --
  zwey -- fle nicht, ſo lang biß Gott das
  Ur -- theil ſpricht iſt Gnad noch zu "er -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2 f
    dis d
    c4 cis h2
    h c
    h gis
  }
}

BassFigures = \figuremode {
  r2 <4 2\+>
  <7 5> <6 4\+>
  <6>4 <6\\> <_+>2
  <6>1
  <6\\>2 <5>
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
