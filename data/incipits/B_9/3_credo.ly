\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "[Molto] andante"
    cis'8 d e2 e fis8 gis
    a4 a, r e'2 fis8 gis
    a4 a,8 h cis d e2 a4
    gis8 h gis h e, gis h, e gis, h e, h'
    cis4 a, r cis' d8 a d e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/2 \tempoMarkup "[Molto] andante"
    a'4. h8 cis4 h8 a gis4 fis
    e a8 h cis4 h8 a gis4 fis
    e4. fis16 gis a4 h cis4.\trill cis8
    h gis' e gis h, e gis, h e,4 gis
    r e8 d cis4 e a a,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[Molto] andante"
    r4 e'^\tutti e e e e
    e e r e e e
    e e r e, e2
    e r4 gis2 gis4
    a2 a4 a a a
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[Molto] andante"
    r4 e^\tutti e e e fis8[ gis]
    a4 a, r e' e fis8[ gis]
    a4 a, r h cis2
    h r4 e2 e4
    e2 e4 e d4. e8
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[Molto] andante"
    r4 a8[^\tutti h] cis4 h8[ a] gis4 a8[ h]
    cis4 cis r h8[ a] gis4 a8[ h]
    cis4 cis r h a2
    gis r4 h2 h4
    cis2 cis4 cis a4. a8
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "[Molto] andante"
    r4 a^\tutti a' gis8[ fis] e4 d
    cis a r gis'8[ fis] e4 d
    cis a r e' a a,
    e'2 r4 e2 e4
    a2 a4 a8[ gis] fis4. e8
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \tempoMarkup "[Molto] andante"
    a4-\tutti cis'8 h a4 gis8 fis e4 d
    cis cis'8 h a4 gis8 fis e4 d
    cis cis'8 h a4 e cis a
    e2 r4 e'2 e4
    a cis8 h a4 a8 gis fis4 fis8 e
  }
}

BassFigures = \figuremode {
  %tacet
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
