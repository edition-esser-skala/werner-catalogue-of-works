\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/2 \tempoMarkup "Andante"
    R1.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/2 \tempoMarkup "Andante"
    R1.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    r2 r4 a'^\solo h cis
    d2 cis8[ d cis d] e4 d
    cis h a2 r
    r e'4. e8 e4 d
    cis4.\trill cis8 h4 h4. a8 g4
  }
}

SopranoLyrics = \lyricmode {
  Fa -- cto -- rem
  coe -- li __ _ et
  ter -- _ rae,
  et in u -- num
  Do -- mi -- num Je -- _ sum
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    d2^\solo a'4 h fis8[ g] fis[ g]
    a4 d,8 d e4 fis g2
    fis4 gis a2 a4 h
    a gis a2 r
    R1.
    r2 r r4 e
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem coe --
  li et ter -- rae, et
  ter -- _ rae,

  "Fi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*3
    e4^\solo e cis h8 a d4 e8 fis
    h,4 d e cis8[ h] ais4 h~
    h ais h2 r
  }
}

TenoreLyrics = \lyricmode {
  Vi -- si -- bi -- li -- um o -- mni -- um %4
  et in -- vi -- si -- bi -- _
  li -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*3
    r2 a'4^\solo a fis e8 d
    g4 a8 h e,4 g fis g
    e fis h,2 r
  }
}

BassoLyrics = \lyricmode {
  Vi -- si -- bi -- li -- um %4
  o -- mni -- um et in -- vi -- si --
  bi -- li -- um,
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/2 \tempoMarkup "Andante"
    d4.-\solo e8 fis4 g d h
    fis' h8 a g4 fis e2
    h' fis4 e8 d cis4 d
    e e, a a' fis e8 d
    g4 a8 h e,4 g fis g
    e fis dis e8 fis g4 c
  }
}

BassFigures = \figuremode {
  r1.
  <6>2 q4 q <5> <6>
  <5> <6\\> <5 3>2 <6>4 q
  <6 4> <5 _+> r1
  r2. <6>4 <7 _+> <5>
  <6 5> <_+> <6 5>1
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
