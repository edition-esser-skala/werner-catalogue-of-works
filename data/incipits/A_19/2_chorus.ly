\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \dorian \time 4/4 \tempoMarkup "Ariose"
    r8 d' d d es4 r
    r8 d g d cis4 r
    r8 c a' c, h4 r
    r8 c es g b, b b b
    b( a) a( c) c(\p b16) d g8 g,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \dorian \time 4/4 \tempoMarkup "Ariose"
    r2 r8 c' a' c,
    b4 r r8 e! a e
    a,4 r r8 d g h,
    c4 r r8 g g g
    g( fis) fis( a) a(\p g) b b,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    r8 d' d d es4 r
    r8 d g d cis4 r
    r8 c a' c, h4 r
    r8 c es g b, b b b
    b[ a] a4 r2
  }
}

SopranoLyrics = \lyricmode {
  Gott Is -- ra -- el,
  blikh auf daß Joch,
  blikh auf daß Joch,
  ſo un -- ßern Ohn -- machts -- na -- ken
  drü -- ket.
}

Alto = {
  \relative c' {
    \clef alto
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    r2 r8 a' a a
    b4 r r8 e,! a e
    d4 r r8 d g h,
    c4 r r8 g' g g
    g[ fis] fis4 r2
  }
}

AltoLyrics = \lyricmode {
  Gott Is -- ra --
  el, blickh auf daß
  Joch, blickh auf daß
  Joch, den Na -- ken
  drü -- ket.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    r8 b b b c4 r
    r8 b b b a4 r
    r8 a fis a g4 r
    r r8 g e'! e e e
    d4 d r2
  }
}

TenoreLyrics = \lyricmode {
  Gott Is -- ra -- el,
  blickh auf daß Joch,
  blickh auf daß Joch,
  ſo un -- ßern Na -- ken
  drü -- ket.
}

Basso = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    r2 r8 fis fis fis
    g4 r r8 g g g
    fis4 r r8 f f f
    es4 r r8 cis cis cis
    d4 d r2
  }
}

BassoLyrics = \lyricmode {
  Gott Is -- ra --
  el, blickh auf daß
  Joch, blickh auf daß
  Joch, den Na -- ken
  drü -- ket.
}

Continuo = {
  \relative c {
    \clef bass
    \key g \dorian \time 4/4 \tempoMarkup "Ariose"
    g4 r r8 fis' fis fis
    g4 r r8 g g g
    fis4 r r8 f f f
    es4 r r8 cis cis cis
    d2~ \mvTr d~\p-\tasto
  }
}

BassFigures = \figuremode {
  r2 r8 <7- 5>4.
  r2 r8 <4\+ 2>4.
  <6>2 r8 <4! 2>4.
  <6>2 r8 <7- 5>4.
  <6 4>8 <5 _+>2..
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
