\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    r8 a'\fE cis e a e4 fis16 gis
    a8 e4 fis16 gis a8 gis16 fis e8 d
    cis16 a cis e a8 cis cis16( h) a gis h( a) gis fis \gotoBar "13"
    a,8 a' h, gis' a4 r
    R1
    r2 r16 a,\p cis e a8 a,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    R1*3 \gotoBar "13"
    e8 a, fis' h, cis4 r
    R1
    r2 r4 r16 e\p a cis
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*3 \gotoBar "13"
    r2 r8 a^\solo cis e
    a e4 fis16[ gis] a8 e4 fis16[ gis]
    a8[ gis16 fis] e8 d cis a r cis'
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li lae -- ta -- re, lae --
  ta -- re Re -- gi -- na, "lae -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a4 r a'8 cis4 h8
    a cis4 h8 a4 gis
    a8 a, cis a gis4 fis \gotoBar "13"
    cis'8 fis d e a,4 r
    a8 cis4 h8 a cis4 h8
    a4 gis a r8 a'
  }
}

BassFigures = \figuremode {
  r2.. <6\\>8
  r4. q8 r2
  r2. <7>8 <6\\>
  r4 <6 5>2.
  r4. <6\\>2 q8
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
