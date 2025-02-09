\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    e'4 fis e fis
    g fis eis fis8 fis
    gis4 fis e e~
    e dis e2\fermata
    r8 e4 e8 e( d) d4
    r8 d4 d8 cis4 d~
    d8 d cis4 h4. e8
    cis e~\p e16 d e8 r h'~ h16 a h8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    cis'4 d2 cis4
    h cis h a8. h16
    cis4 d2 cis4
    h a gis2\fermata
    r8 cis4 cis8 cis( h) h4
    r8 fis g4. fis8 fis4
    h e, e2\trill
    e8 cis'~\p cis16 h cis8 r eis gis16( fis) gis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    cis'4^\tutti d d cis
    h fis' eis d!8 d
    cis4 d2 cis4
    h a gis2\fermata
    r8 cis4 cis8 cis[ h] h4
    r8 d4 d8 cis4 d~
    d cis h2\trill
    cis4 r r2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- _ ta
  mun -- _ di:
  Mi -- se -- re -- re,
  mi -- se -- re -- _
  re no --
  bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4^\tutti fis e fis
    g fis gis a8 a
    gis4 fis e! e~
    e dis e2\fermata
    r8 e4 e8 e[ d] d4
    r8 fis g4 g8[ fis] fis4
    h e, e2\trill
    e4 r eis8[^\solo gis] h[ cis]
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- _ ta mun --
  _ di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- _ _
  bis. A -- gnus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a2.^\tutti cis4
    d cis h8 h a4
    cis a h a
    gis a h2\fermata
    r8 g4 g8 fis4 fis
    r8 h d4 e8[ a,!] a4
    gis! a2 gis4
    a r r2
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- _ i, qui tol --
  lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- _ _
  bis.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'2.^\tutti ais4
    h a8 a gis!4 fis
    eis fis gis a
    e fis e2\fermata
    ais,4. ais8 h4 h
    r8 h'4 h8 a!4 d,
    h a e'2
    a,4 r r2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- _
  lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- _ _
  bis.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Largo"
    a'2.-\tutti ais4
    h a gis! fis
    eis fis gis a
    e fis e2\fermata
    ais, h
    h' a!4 d,
    h a e'2
    a,4 a' gis r
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
