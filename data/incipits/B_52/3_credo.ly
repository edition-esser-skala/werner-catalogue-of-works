\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Vivace"
    f'16 g e g f c d e f c' b a
    g a f g e8 g c16 d b c
    a b a g f c' b c a b g a
    f e d c b c d e f a g b
    a b c b a b g a f a g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Vivace"
    f'16 g e g f c d e f c' b a
    g a f g e8 g c16 d b c
    a b a g f c' b c a b g a
    f e d c b c d e f a g b
    a b c b a b g a f a g a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c'2.~^\tutti
    c
    a2 r4
    b b2
    a2.
  }
}

SopranoLyrics = \lyricmode {
  Cre --

  do
  in u --
  num
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c'2.~^\tutti
    c
    a2 r4
    b b2
    a2.
  }
}

AltoLyrics = \lyricmode {
  Cre --

  do
  in u --
  num
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c2.~^\tutti
    c
    a2 r4
    b b2
    a2.
  }
}

TenoreLyrics = \lyricmode {
  Cre --

  do
  in u --
  num
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c'2.~^\tutti
    c
    a2 r4
    b b2
    a2.
  }
}

BassoLyrics = \lyricmode {
  Cre --

  do
  in u --
  num
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Vivace"
    f8[-\tutti g a g] a g16 f
    e8 d c b a g
    f f'16 g a8 g f e
    d b16 c d8 b d e
    f16 g a g f8 e d c
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <6>4 q2
  r2.
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
