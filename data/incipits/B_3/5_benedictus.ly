\version "2.24.2"
\include "header.ly"

ViolinoIeII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Tempo ordinario"
    d'8\f fis16. d32 a'8 a,16. cis32 d8 d, d4
    r2 r8 a'16. d32 fis8 fis,
    r fis'16. ais32 cis8 fis,, r h16. d32 fis8 h,,
    r2 r8 a''16. cis32 h8 h,16. d32
    cis16. a'32 e16. cis32 a8 a,16. g'!32 fis8 d r d'16. d32
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 d'4.^\solo^\aTre fis8
    fis[ e] d cis d16[ cis] d8 r a
    cis4 cis8 cis d16[ cis] d8 r d
    h cis16 d \appoggiatura cis8 h8. h16 a4 r
    r2 a4 d
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit, qui ve -- nit in
  no -- mi -- ne Do -- mi -- ni,
  be -- "ne -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 fis4.^\solo^\aTre a8
    a[ g] fis e fis16[ e] fis8 r fis
    fis4 fis8 fis fis fis r fis
    gis a16 a \appoggiatura a8 \hA gis8. gis16 a4 r
    r2 fis4. fis8
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit, qui ve -- nit in
  no -- mi -- ne Do -- mi -- ni,
  be -- "ne -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 h4^\solo^\aTre fis
    g a8 a d, d r d'
    ais4 ais8 ais h16[ \hA ais] h8 r h
    e a,16 a e8. e16 a4 r
    r2 d4 h
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit, qui ve -- nit in
  no -- mi -- ne Do -- mi -- ni,
  be -- "ne -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Tempo ordinario"
    d'4-\solo^\aTre cis h fis
    g a d, d'
    ais4. ais8 h2
    e8 a, e4 a gis
    a cis d h
  }
}

BassFigures = \figuremode {
  r1
  <9 7>8 <8 6> <6 4> <5 _+> r2
  <6>1
  <_+>4 <4>8 <_+>4. r4
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "vl" "1, 2" }
        \ViolinoIeII
      }
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
