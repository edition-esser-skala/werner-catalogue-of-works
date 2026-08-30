\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a''8 a, r cis16 a e'8 e, r gis'16 e
    a8 cis h16 cis a h gis a fis gis e fis d e
    cis8 a r cis16 a e'8 e, r gis'16 e
    a8 cis h16 cis a h gis a fis gis e fis d e
    cis8 a r cis h cis16 d e8 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a''8 a, r cis16 a e'8 e, r gis'16 e
    a8 cis h16 cis a h gis a fis gis e fis d e
    cis8 a r cis16 a e'8 e, r gis'16 e
    a8 cis h16 cis a h gis a fis gis e fis d e
    cis8 a r a gis a16 h gis8 h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e'2^\tutti e
    e r
    e e
    e r4 r8 h
    cis[ h16 cis] d8[ cis] h4 r8 h\p
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e,
  Ky -- ri --
  e e --
  lei -- _ son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e2.^\tutti gis4
    a2 r
    e2. gis4
    a2 r4 r8 gis
    a[ gis16 a] h8[ a] gis4 r8 gis\p
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e,
  Ky -- ri --
  e e --
  lei -- _ son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    cis2^\tutti h
    cis r
    cis h
    cis r
    r8 e4 e8 e4 r
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e,
  Ky -- ri --
  e,
  Ky -- ri -- e,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a'8[^\tutti cis] h[ a] gis fis e[ d]
    cis4 r r2
    a'8[ cis] h[ a] gis fis e[ d]
    cis4 r r2
    r8 a'4 a8 e4 r
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son,
  Ky -- ri -- e e -- lei --
  son,
  Ky -- ri -- e,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Allegro"
    a'8-\tutti cis h a gis fis e d
    cis a' gis fis e d cis h
    a cis' h a gis fis e d
    cis a' gis fis e d cis h
    a4 r8 a' e4 r8 e
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r2.. <7>8
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
