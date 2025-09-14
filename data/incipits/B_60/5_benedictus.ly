\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key fis \minor \time 3/4 \tempoMarkup "Ordinari"
    fis'8 cis a fis r a'
    gis cis, gis eis r gis'
    a cis, a fis r a'
    d, fis, d h r h'
    gis e! h gis r gis''
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key fis \minor \time 3/4 \tempoMarkup "Ordinari"
    fis'8 cis a fis r a'
    gis cis, gis eis r gis'
    a cis, a fis r a'
    d, fis, d h r h'
    gis e! h gis r gis''
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key fis \minor \time 3/4 \autoBeamOff \tempoMarkup "Ordinari"
    r4 cis'4.^\aTre a8
    gis4 gis r8 cis
    a4 a r8 cis
    d4. d8 fis[ d]
    h8. h16 h4 r8 h
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit in
  no -- mi -- ne __
  Do -- mi -- ni, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key fis \minor \time 3/4 \autoBeamOff \tempoMarkup "Ordinari"
    r4 a'8[^\aTre a,] cis[ fis]
    eis4 eis r8 gis
    cis,4 cis r8 a'
    fis4. fis8 d[ h']
    gis8. gis16 gis4 r8 gis
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit in
  no -- mi -- ne __
  Do -- mi -- ni, qui
}

Tenore = {
  \relative c' {
    \clef tenor
    \key fis \minor \time 3/4 \autoBeamOff \tempoMarkup "Ordinari"
    r4 fis,4.^\aTre fis8
    cis'4 cis, r8 cis'
    fis4 fis, r8 fis
    h4. h8 d[ h]
    e!8. e,16 e4 r8 e
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit in
  no -- mi -- ne __
  Do -- mi -- ni, qui
}

Organo = {
  \relative c {
    \clef tenor
    \key fis \minor \time 3/4 \tempoMarkup "Ordinari"
    fis4-\solo-\aTre r8 fis' a, fis
    cis'4 r8 cis eis, cis
    fis4 r8 fis a fis
    h4 r8 h d h
    e!4 r8 e, gis e
  }
}

BassFigures = \figuremode {
  r2.
  <_+>
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
