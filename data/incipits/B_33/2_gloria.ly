\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    r32 e fis gis a h cis d e cis d e fis gis a h cis16-! a-! e-! a-! e-! cis-! a-! e-!
    cis32 a h cis d e fis gis a h cis d e fis gis a gis a h cis h a gis fis e fis gis a gis fis e d
    cis e, fis gis a h cis d e gis h a gis fis e d cis16-! e-! gis-! h-! a-! e-! cis-! a'-!
    gis32 a h cis h a gis fis e16-! h-! gis-! h-! e, e32 e e16 e e4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    r32 cis d e fis gis a h cis a h cis d e fis gis a16-! e-! cis-! e-! cis-! a-! e-! cis-!
    r32 a h cis d e fis gis a h cis d e fis gis a gis a h a gis a gis fis e fis gis fis e fis e d
    cis e, fis gis a h cis d e gis h a gis fis e d cis16-! e-! gis-! h-! a-! e-! cis-! a'-!
    gis32 a h cis h a gis fis e16-! h-! gis-! h-! e,16 e32 e e16 e e4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    cis'8.^\tutti cis16 cis4 r2
    cis8. cis16 cis4 h8 h e e
    cis cis h e16 e cis8 e a cis,
    h h r4 r2
  }
}

SopranoLyrics = \lyricmode {
  Glo -- ri -- a,
  glo -- ri -- a in ex -- cel -- sis
  De -- o, glo -- ri -- a in ex -- cel -- sis
  De -- o.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    e8.^\tutti e16 e4 r2
    e8. e16 e4 e8 e h' gis
    e e e gis16 gis e8 gis e a
    gis gis r4 r2
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri -- a,
  glo -- ri -- a in ex -- cel -- sis
  De -- o, glo -- ri -- a in ex -- cel -- sis
  De -- o.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a8.^\tutti a16 a4 r2
    a8. a16 a4 gis8 h e, h'
    a a h h16 h a8 h cis e
    e e r4 r2
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a,
  glo -- ri -- a in ex -- cel -- sis
  De -- o, glo -- ri -- a in ex -- cel -- sis
  De -- o.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a'8.^\tutti a,16 a4 r2
    a'8. a,16 a4 e'8 e gis e
    a a gis e16 e a8 e cis a
    e' e r4 r2
  }
}

BassoLyrics = \lyricmode {
  Glo -- ri -- a,
  glo -- ri -- a in ex -- cel -- sis
  De -- o, glo -- ri -- a in ex -- cel -- sis
  De -- o.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Vivace"
    a'8.-\tutti a,16 a4 r2
    a'8. a,16 a4 e8 e' gis e
    a, a' gis e a e cis a
    e' e, r4 r2
  }
}

BassFigures = \figuremode {
  r1
  r
  r
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
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
