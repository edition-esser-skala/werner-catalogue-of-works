\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    d'4. h8 e4. c8 a4 d
    h4. d8 g4. e8 cis4. e8
    a4. fis8 d4. g8 e4 a
    fis d4. h8 g'4. e8 c4~
    c8 a fis'4. d8 h4. g8 c4~
    c8 a h g' a,4 fis' g2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    r4 g'4. e8 a4. fis8 d fis
    g4 h4. g8 h4 e, cis'~
    cis8 a cis4 fis, d'2 cis4
    d2 r4 d h e~
    e8 c a2 d4. h8 g4
    fis g a4. d8 h2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    h'2^\tutti c4 c a d
    h h h e2 cis4~
    cis fis d d d cis
    d d2 h e4~
    e c a d4. h8 c4~
    c h a4. a8 h4 h~^\solo
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem __
  coe -- li et ter -- _
  rae, vi -- si -- bi --
  li -- um et in -- vi --
  si -- bi -- li -- um. Et
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g'2^\tutti g4 a fis fis
    g g g2 e
    a4 a fis g e2\trill
    fis4 fis2 g4 g4. g8
    a4 fis fis fis g4. e8
    fis4 g g fis g2
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto --
  rem coe -- li et ter --
  rae, vi -- si -- bi -- li --
  um o -- mni -- um et in --
  vi -- si -- bi -- li -- um.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    d2^\tutti e4 e d d
    d d e2 cis
    fis4 cis d h a2
    a4 a h2 h4 c!~
    c8 c a2 h e4
    d d d4. d8 d2
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto --
  rem coe -- li et ter --
  rae, vi -- si -- bi -- _
  li -- um et in --
  vi -- si -- bi -- li -- um.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g'2^\tutti c,4 c d d
    g, g r e' a a
    fis2 h4 g a2
    d,4 d h2 e4. e8
    a,4 a' fis d g e8[ c]
    d4 g d4. d8 g,2
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si -- bi -- li --
  um o -- mni -- um et in --
  vi -- si -- bi -- li -- um.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Vivace"
    g'2-\tutti c, d
    << { g } \\ { g, } >> e' a
    fis h4 g a a,
    d2 h e
    a, d g4 e8 c
    d4 g d d, g g'~-\solo
  }
}

BassFigures = \figuremode {
  r2 <5>4 <6>2.
  r1 <_+>2
  <5>1 <4>4 <_+>
  r2 <5>4 <6> <5> <6>
  <5> <6\\> <5> <6>2.
  <7>2 <4>4 <_+>2.
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
