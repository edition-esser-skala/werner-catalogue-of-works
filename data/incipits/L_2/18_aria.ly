\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 12/8 \tempoMarkup "Allegretto"
    \partial 8 e8\f a e cis' a4 e8 cis' a e' cis4 e8 \gotoBar "5"
    fis,16 d' cis8 h a16 e cis' a e'8 fis,16\p d' cis8 h a a, r
    r cis' e r a, cis r e, a r e cis
    r r a' e' gis16 fis e8 a gis16 fis e dis e4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 12/8 \tempoMarkup "Allegretto"
    \partial 8 r8 r4 r8 r r e a e cis' a4 e'8 \gotoBar "5"
    fis,16 h a8 gis a16 cis, e a cis8 fis,16\p h a8 gis a a, r
    r a' cis r e, a r cis, e r cis a
    r r a' e' h gis cis h16 a gis fis gis4 r8
  }
}

Soli = {
  \relative c {
    \clef bass
    \key a \major \time 12/8 \autoBeamOff \tempoMarkup "Allegretto"
    \partial 8 r8 R1. \gotoBar "5"
    r2*3/2 r4 r8 r r e
    a e cis' a e a e cis e a,4 e'8
    a cis16[ h] a8 h gis e a gis16[ fis] e[ dis] h'8 a16[ gis] fis[ e]
  }
}

SoliLyrics = \lyricmode {
  Äß
  iß hiez beym Bau -- ren faſt gar koä Re -- ſpect wann
  oä -- ner viel Jahr ſchon bey öe -- nen er -- ſtre -- cket, bey
}

Continuo = {
  \relative c {
    \clef bass
    \key a \major \time 12/8 \tempoMarkup "Allegretto"
    \partial 8 r8 a4 r8 a' e cis a4 r8 a' e cis \gotoBar "5"
    d e e, a4 r8 d e e, a4 r8
    a4 r8 a' e a e cis e a, cis e
    a4 fis8 gis4 cis8 fis,4 h8 gis e r
  }
}

BassFigures = \figuremode {
  r8 r1.
  <8 6>8 <6 4> <5 _+> r4. <8 6>8 <6 4> <5 _+> r4.
  r1.
  r
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
        \set Staff.instrumentName = "Barthlme"
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
