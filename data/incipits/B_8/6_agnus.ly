\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \major \time 3/2 \tempoMarkup "Tempo ordinario"
    R1.*4
    r2 r r4-\solo dis
    e2. e4 fis8 e fis4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \major \time 3/2 \tempoMarkup "Tempo ordinario"
    R1.*4
    r2 r4 fis-\solo h2~
    h ais a~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    h'2.^\solo^\markup \remark "a 3" cis4 dis2
    e e dis
    cis dis e
    e dis e
    e dis dis
    R1.
  }
}

SopranoLyrics = \lyricmode {
  A -- _ gnus
  De -- i, qui
  tol -- lis pec --
  ca -- _ ta
  mun -- _ di:
}

Alto = {
  \relative c' {
    \clef alto
    \key e \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    gis'1^\solo^\markup \remark "a 3" fis2
    e4 fis gis a h2
    e, a gis
    fis h ais
    h fis1
    R1.
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- _ i, __ _ qui
  tol -- lis pec --
  ca -- _ ta
  mun -- di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    e1^\solo^\markup \remark "a 3" h2
    cis cis gis
    a fis e
    h'1 cis2
    h1 h2
    R1.
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta
  mun -- di:
}

Basso = {
  \relative c {
    \clef bass
    \key e \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1.*4
    r2 h^\solo h
    c cis dis!
  }
}

BassoLyrics = \lyricmode {
  Mi -- se --
  re -- _ re,
}

Organo = {
  \relative c {
    \clef tenor
    \key e \major \time 3/2 \tempoMarkup "Tempo ordinario"
    e'1-\solo-\markup \remark "a 3" h2
    cis1 gis2
    a fis e
    h'1 cis2
    h \clef bass h,1
    c2 cis dis!
  }
}

BassFigures = \figuremode {
  <5>2. <6>4 <_+>2
  r1 <5\+>2
  r <6\\>1
  <4>2 <_+> <6\\>
  <4> <_+>1
  <7>2 <6\\> <5!>
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "b"
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
