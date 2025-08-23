\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "[no tempo]"
    cis'4 cis, r cis' h e
    cis cis, r cis' h e
    cis cis fis2 r4 dis
    e2 cis4 e2 dis4
    e h e2 cis
    a4. a8 d!2 h4. h8
    cis2 r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "[no tempo]"
    a'4 a, r e'2 gis4
    a a, r e'2 gis4
    a2 r4 a fis2
    gis4 h a gis fis2
    gis r4 gis e2
    fis4 a2 fis4 e4. e8
    e2 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 e'^\tutti e e e2
    r4 e e e e2
    r4 cis fis2 r4 dis
    e2 cis4 e e dis
    e h e2 cis
    a4. a8 d!2 h4. h8
    cis2 r r
  }
}

SopranoLyrics = \lyricmode {
  Lae -- ta -- tus sum,
  lae -- ta -- tus sum
  in his, quae
  di -- cta sunt mi -- _
  hi: In do -- mum
  Do -- mi -- ni i -- bi --
  mus.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r4 e^\tutti e e
    e2 r4 e e e
    e2 r4 a fis2
    r4 h a gis8 gis fis2
    gis r4 gis e2
    fis4 a2 fis8 fis e4. e8
    e2 e1^\solo
  }
}

AltoLyrics = \lyricmode {
  Lae -- ta -- tus
  sum, lae -- ta -- tus
  sum in his,
  quae di -- cta sunt mi --
  hi: In do --
  mum Do -- mi -- ni i -- bi --
  mus. "Stan -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r4 cis^\tutti h gis
    cis2 r4 cis h gis
    cis2 r4 cis dis2
    r4 h cis h8 h h2
    h r r4 cis~
    cis a2 a4 a gis
    a2 r r
  }
}

TenoreLyrics = \lyricmode {
  Lae -- ta -- tus
  sum, lae -- ta -- tus
  sum in his,
  quae di -- cta sunt mi --
  hi: In __
  do -- mum i -- bi --
  mus.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r4 a'^\tutti gis e
    a2 r4 a gis e
    a2 r4 fis h2
    r4 gis a e8 e h2
    e r4 e a2
    fis4 fis2 d8 d e4. e8
    a,2 r r
  }
}

BassoLyrics = \lyricmode {
  Lae -- ta -- tus
  sum, lae -- ta -- tus
  sum in his,
  quae di -- cta sunt mi --
  hi: In do --
  mum Do -- mi -- ni i -- bi --
  mus.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \tempoMarkup "[no tempo]"
    a2-\tutti r4 a' gis e
    a2 r4 a gis e
    a2 r4 fis h2
    r4 gis a e h2
    e r4 e a2
    fis2. d4 e2
    a4 h cis-\solo h8 a gis4 fis
  }
}

BassFigures = \figuremode {
  r1.
  r
  r1 <_+>2
  r1 <4>4 <_+>
  r1.
  <5>2 <6> <4>4 <3>
  r1.
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
}
