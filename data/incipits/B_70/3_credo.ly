\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Vivace"
    R1.*4
    r2 c'4. c8 d es f4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Vivace"
    R1.*4
    r2 r4 f4. g8 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.*2
    r2 c'4^\solo c f d8 c
    h4 c2 \hA h4 c2
    R1.
  }
}

SopranoLyrics = \lyricmode {
  vi -- si -- bi -- li -- um
  o -- _ mni -- um
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    d2^\solo g8[ a] b4 a g
    fis2 g4 r r2
    R1.*3
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.
    r4 a^\solo d b8[ a] g[ a b c]
    \tuplet 3/2 4 { d[ es f] es[ d c] } b4 a b r
    r2 g4 g es' c8[ b]
    a4 b2 a4 b2
  }
}

TenoreLyrics = \lyricmode {
  fa -- cto -- rem coe --
  li et ter -- _ rae,
  et in -- vi -- si --
  bi -- _ li -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    R1.*4
    f4^\solo g es f b a8 a
  }
}

BassoLyrics = \lyricmode {
  et in u -- num Do -- mi -- num
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "Vivace"
    g4-\solo g'8 f es4 d c8 d es4
    d8 a d c b4 d es d8 c
    b4 g' f4. es8 d4 f
    g es8 f g4 g, c es
    f g es f << { b } \\ { b, } >> a'
  }
}

BassFigures = \figuremode {
  r2. <6>4 q <3>
  <_+>2 <6>4 q2.
  r4 <6> <4> <3> <6> q
  <_!> r <4> <_!>2.
  r2 <6 5>2. <6>4
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
