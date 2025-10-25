\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "Andante"
    R1.
    r4 g'8 a h4 h2 c8 d
    e2. fis4 g a
    h g d h r g'
    e e r a fis fis
    r g d2 cis
    h2 r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "Andante"
    R1.
    r4 e2 fis4 g2~
    g4 a8 h c4 d e fis
    g d h g r e'
    cis cis r fis d d
    h2. ais8 gis \hA ais2
    h2 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*5
    r2 fis'^\solo fis4 fis
    d h dis2. e8[ fis]
  }
}

SopranoLyrics = \lyricmode {
  Po -- tens in
  ter -- ra e -- rit
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*6
    r2 h'^\solo h4 h
  }
}

AltoLyrics = \lyricmode {
  Po -- tens in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*7
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    e2^\solo h'2. a4
    g2 r4 fis e d!
    c h a2. a4
    g2 g'4 g e e
    a a fis fis h8[ c h a]
    g4 e fis1
    h,2 r r
  }
}

BassoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti -- _
  met _ Do -- mi --
  num: In man -- da -- tis
  e -- ius vo -- let, vo --
  _ let ni --
  mis.
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "Andante"
    e2-\solo dis h
    e4. fis8 g4 fis e d
    c h a1
    g2 g'4 g e e
    a a fis fis h4. a8
    g4 e fis2 fis,
    h2. h'4 dis, h
  }
}

BassFigures = \figuremode {
  r1.
  r
  r2 <5>2. <6\\>4
  r1.
  <_+>1.
  r2 <6 4> <5\+ _+>
  <_!> <_+>1
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
