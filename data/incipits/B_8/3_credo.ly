\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \major \time 6/4 \tempoMarkup "Andante"
    R1.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \major \time 6/4 \tempoMarkup "Andante"
    R1.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \major \time 6/4 \autoBeamOff \tempoMarkup "Andante"
    e'4^\solo h cis gis2 a4
    h e, r e8[ gis] h4 cis
    ais h e \tuplet 3/2 4 { dis8[ cis h] } cis2\trill
    h4 r r r2 r4
    h e cis ais h8[ \hA ais] h4
    e8[ cis] \appoggiatura h4 ais4.\trill ais8 h4 r r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae,
  Fi -- li -- um De -- i __ u --
  ni -- ge -- ni -- tum,
}

Alto = {
  \relative c' {
    \clef alto
    \key e \major \time 6/4 \autoBeamOff \tempoMarkup "Andante"
    R1.
    r2 r4 r e^\solo gis
    fis4. gis8 ais4 h2 \hA ais4
    h r r r e, fis
    fis8[ e] e4 r r r dis
    gis cis, fis8[ e] dis[ cis] h4 r
  }
}

AltoLyrics = \lyricmode {
  vi -- si --
  bi -- li -- um o -- mni --
  um Je -- sum
  Chri -- stum, et
  ex Pa -- tre na -- tum
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \major \time 6/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r4 e^\solo h cis
    gis2 a4 h e, r
    R1.
    e'4. dis8 cis4 h a4. a8
    gis4 r r r2 r4
    R1.
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem,

  et in u -- num Do -- mi --
  num
}

Basso = {
  \relative c {
    \clef bass
    \key e \major \time 6/4 \autoBeamOff \tempoMarkup "Andante"
    R1.*2
    r2 r4 r e^\solo fis
    gis e a gis8[ fis] e4 dis
    e r r r2 r4
    r2 r4 r r gis
  }
}

BassoLyrics = \lyricmode {
  et in --
  vi -- _ si -- bi -- _ li --
  um,
  et
}

Organo = {
  \relative c {
    \clef bass
    \key e \major \time 6/4 \tempoMarkup "Andante"
    e8-\solo fis gis4 a e2 a,4
    e'8 dis cis4 h8 a gis2 e'4
    fis8 e dis4 cis h e fis
    gis e a, h cis dis
    e cis e fis dis gis
    e fis fis, h h' gis
  }
}

BassFigures = \figuremode {
  r1.
  r2. r2 <6>4
  <_+> <6> <6\\>2 <6 5>4 <_+>
  <6>2. q8 <5> <6>4 <\t>
  <9> r <6> <_+> <6>2
  <5>8 <6> <4>4 <_+> r2.
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
