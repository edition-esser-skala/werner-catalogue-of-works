\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c'1 d2 d
    d c1 b2
    b es d d
    d2. d4 d1
    r2 b1 b2
    as h1 h2
    c4 h c2 h1
  }
}

SopranoLyrics = \lyricmode {
  Si -- cut o --
  vis ad oc --
  ci -- si -- o -- nem
  du -- ctus est,
  et cum
  ma -- le tra --
  cta -- _ re -- tur,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 f
    e d2 d
    g g4 g fis2 g
    g fis g1
    g f2 g~
    g4 g f1 es4 d
    es1 d
  }
}

AltoLyrics = \lyricmode {
  Si -- cut
  o -- vis ad
  oc -- ci -- si -- o -- nem
  du -- ctus est,
  et cum ma --
  le tra -- cta -- _
  re -- tur,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a1. a2
    a a a g
    g c c b
    a2. a4 g1
    b2 es d c~
    c d1 h2
    g fis g1
  }
}

TenoreLyrics = \lyricmode {
  Si -- cut
  o -- vis ad oc --
  ci -- si -- o -- nem
  du -- ctus est,
  et cum ma -- le __
  tra -- cta --
  re -- _ tur,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1. d2
    a'1 fis2 g
    es c4 c d2 g
    d2. d4 g,1
    es'2. es4 d2 e
    f d1 g2
    c,1 g
  }
}

BassoLyrics = \lyricmode {
  Si -- cut
  o -- vis ad
  oc -- ci -- si -- o -- nem
  du -- ctus est,
  et cum ma -- _
  le tra -- cta --
  re -- tur,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    f1. d2
    a'1 fis2 g
    es c d g
    d1 g,
    es' d2 e
    f d1 g2
    c,1 g
  }
}

BassFigures = \figuremode {
  r1 <6>
  <4>2 <3> <6 5>1
  r1 <7 _+>
  <4>2 <_+>1.
  r1 <6>2 <6 5>
  <9 _-> <6!>1 <_!>2
  <_-> <6 4\+> <_!>1
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
