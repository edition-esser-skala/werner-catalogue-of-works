\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "Vivace"
    a'8 e cis e a,4 a' d, e
    a8 e cis e a,4 a' d, e
    a8 e cis e a4 e cis a
    e'8 fis16 gis a h cis d e8 h gis h e h gis h
    eis,2 r r
    cis8 dis16 eis fis gis a h cis8 gis eis gis cis gis eis gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "Vivace"
    a'8 e cis e a,4 a' d, e
    a8 e cis e a,4 a' d, e
    a8 e cis e a4 e cis a
    e'8 fis16 gis a h cis d e8 h gis h e h gis h
    eis,2 r r
    cis8 dis16 eis fis gis a h cis8 gis eis gis cis gis eis gis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    cis'4^\solo cis2 e4 d cis8[ h]
    cis[ h] cis2 e4 d8[ cis] d[ h]
    cis4 e8[ d] cis4 h a cis
    h2 r r
    gis4 cis a gis a a
    gis4. gis8 gis2 r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ li et ter -- _
  rae,
  vi -- si -- bi -- _ li -- um
  o -- mni -- um
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    e4^\solo a2 cis4 h a8[ gis]
    a[ gis] a2 cis4 h8[ a] h[ gis]
    a4 cis8[ h] a4 gis e a
    gis2 r r
    eis4 eis fis eis fis fis
    eis4. eis8 eis2 r
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ li et ter -- _
  rae,
  vi -- si -- bi -- _ li -- um
  o -- mni -- um,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.*4
    cis4 cis cis2 his4 his
    cis4. cis8 cis2 r
  }
}

TenoreLyrics = \lyricmode {
  Vi -- si -- bi -- li -- um
  o -- mni -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.*6
  }
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \tempoMarkup "Vivace"
    a'8-\solo-\tasto e cis e a,2 r4 e'
    a8 e cis e a,2 r4 e'
    a8 e cis e a4 e cis a
    e'2 r r
    \clef tenor cis'1 his2
    cis r r
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  <_+>2 <6 4>4 r2.
  <_+>1.
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
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
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
