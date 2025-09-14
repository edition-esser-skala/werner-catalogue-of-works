\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    a'4.^\solo h8 cis[ d] e4 a, e'
    fis e8[ d] cis4 d e d8[ cis]
    h4 cis8 h a2\trill gis4 r
    r2 r r4 a~
    a gis8 gis cis4 h a gis8[ a]
    fis4. fis8 e2 r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- _ trem o -- mni -- po --
  ten -- _ tem, fa -- cto -- rem
  coe -- li et ter -- rae,
  Fi --
  li -- um De -- i u -- ni --
  ge -- ni -- tum,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*2
    r2 fis4^\solo fis h, e
    d!8[ e] fis[ gis] a4 gis8[ fis] e4 a,
    d2\trill cis4 r r2
    r r e4 e
  }
}

AltoLyrics = \lyricmode {
  Et in u -- num
  Do -- mi -- num Je -- _ sum
  Chri -- stum,
  an -- te
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    r2 a4^\solo h cis h8 a
    gis2 fis4. fis8 e2
    R1.
    r2 r r4 e'~
    e dis e cis h2
  }
}

TenoreLyrics = \lyricmode {
  vi -- si -- bi -- li -- um
  o -- _ mni -- um

  et __
  ex Pa -- tre "na -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    r2 r cis4^\solo d
    e e e dis e2
    R1.*2
    r2 r4 a2 gis4
  }
}

BassoLyrics = \lyricmode {
  et in --
  vi -- si -- bi -- li -- um,

  et ex
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/2 \tempoMarkup "Andante"
    a4-\solo a'2 gis4 fis cis
    d e fis e8 d cis4 d
    e2. dis4 e cis
    << { h' } \\ { h, } >> a'8 gis fis4 e8 d cis4 fis
    h, e a, h cis8 dis e4
    a h gis a2 gis4
  }
}

BassFigures = \figuremode {
  r1.
  r
  <5>4 <6> <4 2>2. <6>4
  r1.
  <7>4 q r1
  <6 5>4 <_+> <6> <5 3> <\t 2> r
}

\score {
  <<
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
