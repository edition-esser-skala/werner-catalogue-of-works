\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key fis \minor \time 3/8 \tempoMarkup "Andante moderato"
    r8 cis'\p fis
    eis16( fis) gis8 h,
    a a' cis,
    d gis e,
    cis'16 e a,8 r
    d16 fis h,8 r
    e16 gis cis,8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key fis \minor \time 3/8 \tempoMarkup "Andante moderato"
    r8 cis'\p fis
    eis16( fis) gis8 h,
    a a' cis,
    d gis e,
    cis'16 e a,8 r
    d16 fis h,8 r
    e16 gis cis,8 r
  }
}

Basso = {
  \relative c {
    \clef bass
    \key fis \minor \time 3/8 \autoBeamOff \tempoMarkup "Andante moderato"
    fis4.^\solo
    gis
    a
    h4 gis8
    a8.[ cis16 fis, a]
    d,[ d' h d gis, h]
    e,[ e' cis e a, cis]
  }
}

BassoLyrics = \lyricmode {
  Be --
  ne --
  di --
  ctus, qui
  "ve -"
}

Organo = {
  \relative c {
    \clef bass
    \key fis \minor \time 3/8 \tempoMarkup "Andante moderato"
    fis8-\solo a fis
    gis eis4
    fis4.
    h,8 e!4
    a8 fis d
    h gis' e
    cis a' fis
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
