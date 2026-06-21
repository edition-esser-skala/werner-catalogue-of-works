\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 e d c h a' g f
    e e' d c h a g f
    e d c d16 e f8 c'4 h16 a
    g f g4 e'8 d16 e c d h d c h
    c e d f e g f g c,8 a f'16 g e f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 e d c h a' g f
    e e' d c h a g f
    e d c d16 e f8 c'4 h16 a
    g a g4 e'8 d16 e c d h d c h
    c e d f e g f g c,8 a f'16 g e f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c2^\tutti g'4 g8 g
    g4. g8 g2
    g4 g a2
    g4 r g g
    g g8 g a a f4
  }
}

SopranoLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el
  de Ae -- gy --
  pto do -- mus
  Ja -- cob de po -- pu -- lo
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c2^\tutti g'4 g8 g
    g4. g8 g2
    g4 g a2
    g4 r g g
    g g8 g a a f4
  }
}

AltoLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el
  de Ae -- gy --
  pto do -- mus
  Ja -- cob de po -- pu -- lo
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c,2^\tutti g'4 g8 g
    g4. g8 g2
    g4 g a2
    g4 r g g
    g g8 g a a f4
  }
}

TenoreLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el
  de Ae -- gy --
  pto do -- mus
  Ja -- cob de po -- pu -- lo
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c2^\tutti g'4 g8 g
    g4. g8 g2
    g4 g a2
    g4 r g g
    g g8 g a a f4
  }
}

BassoLyrics = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el
  de Ae -- gy --
  pto do -- mus
  Ja -- cob de po -- pu -- lo
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti e d c h a g f
    \kneeBeam e e'' d c h a g f
    e d c b a g16 f a8 h
    c d e d16 c << { h'8 a g f } \\ { h, } >>
    e8 d c d16 e f,8 f'16 e d8 c
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
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
