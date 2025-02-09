\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Vivace"
    a'16\f e' cis e cis8 e a gis
    a4 r8 gis a gis
    a4 r8 h, cis h
    cis4 r r
    r8 e4\p h8 e, e'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Vivace"
    a'16\f e' cis e cis8 h cis h
    cis4 r8 h cis h
    cis4 r8 gis a gis
    a cis4\p e,8 a, cis'
    h4 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    cis'8.^\tutti cis16 cis8 h a[ h]
    cis4 r8 h a[ h]
    cis4 r8 h a[ h]
    cis a~^\solo a16[ h cis8] cis16[ d e8]
    h4 r r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, e -- lei --
  son,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    a'8.^\tutti a16 a8 gis e[ gis]
    a4 r8 gis e[ gis]
    a4 r8 gis e[ gis]
    a4 r r
    r8 h,^\solo e16[ fis gis a] h8[ e,]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son,
  e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    e8.^\tutti e16 e8 e e4
    e r8 e e4
    e r8 e e4
    e r r
    R2.
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son,
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    a'8.^\tutti a16 a8 e cis[ e]
    a,4 r8 e' cis[ e]
    a,4 r8 e' cis[ e]
    a,4 r r
    R2.
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Vivace"
    a'4.-\tutti e8 cis e
    a,16 h32 cis d e fis gis a8 e cis e
    a,16 h32 cis d e fis gis a8 e cis e
    a,4 r a'
    gis r g
  }
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
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
