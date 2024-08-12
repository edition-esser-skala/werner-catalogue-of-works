\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    r2 r4 r16 g''\p fis e
    fis g fis g a8 fis r4 r16 g, fis e
    fis8 d r4 r2
    R1
    r2 r8 d' h'16 h a g
    fis8 d r4 r r8 d~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    r2 r4 r16 e'\p d cis
    d e d e fis8 d r4 r16 e, d cis
    d4 r r2
    R1
    r8 cis' fis16 fis e d cis8 a r4
    r2 r4 r8 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d'4^\solo a8 d h d e[ d16 cis]
    d4 r8 d h d e[ d16 cis]
    d8 a h d g,16[ fis] g4 fis8
    e4 r r2
    r r8 d'4 cis8
    d8.\trill cis32[ h] a8. g16 fis8 h4 a8
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe --
  li, coe -- li et ter -- _ _
  rae,
  et in
  u -- num Do -- mi -- num Je -- sum
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r8 e4^\solo d8
    cis cis16 cis d8 e fis4 r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  Vi -- si --
  bi -- li -- um o -- mni -- um,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r4 a4.^\solo a8 d4~
    d8 cis h8. h16 a4 r
    R1
  }
}

TenoreLyrics = \lyricmode {
  Et in -- vi -- %
  si -- bi -- li -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r2 a'4.^\solo a8
    h a a gis a4 r
    R1
  }
}

BassoLyrics = \lyricmode {
  Et in --
  vi -- si -- bi -- li -- um.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d8-\solo e fis h g fis e a
    d,4 r8 h' g fis e a
    d, fis g fis e e'16 d cis8 d
    a g fis cis d cis h fis'
    gis a d, e a fis g a
    d, fis cis a d g cis, fis
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r2.. <6>8
  <6 5>4 q8 <_+>4 r8 <6 5>4
  r4 r2 <7>8 r
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
