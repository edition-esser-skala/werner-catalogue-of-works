\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*3
    r2^\markup \remark "con sordino, stendato" d'
    h c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*3
    r2^\markup \remark "con sordino, stendato" h'
    as a
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Jobs Frau" g'16 g c c e c a8 e16 fis g8 h16 a
    fis8 fis r \hA fis16 gis ais8 cis e fis
    d d r h16 fis g8 h h8. fis16
    fis4 r \clef tenor r^\part Job g,8 h
    d d f! e c c c a
  }
}

SoliLyrics = \lyricmode {
  Nun iſt end -- lich al -- les hin, Hauß und Hoff, Schaaf und
  Rün -- der, auch ſo -- gar die eyg -- ne
  Kin -- der, ich weiß nicht mehr wo ich
  bin. Mei -- ne
  Seel ver -- deüſt zu le -- ben, hätt ich
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    e2 cis
    d cis
    h e4 fis
    h, h'8 d g,2\p^\markup \remark "stendato"
    f! dis~
  }
}

BassFigures = \figuremode {
  <6>2 q
  <_+> <6\\>
  r1
  r4 <6>2.
  <4! _->2 <7 5>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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
