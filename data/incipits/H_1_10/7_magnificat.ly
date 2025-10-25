\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r16 c e g c8 c, r16 e g c e8 e,
    r16 g c e g8 g, r16 c e g c8 c,~
    c h a d h4 r16 d g d
    e8 e, r16 g' c g a8 c h c
    h h r4 r8 g4 c8
    a c4 h8 c16 c, e g c8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r4 r16 c e g c8 c, r16 e g c
    e8 e, r16 g c e g8 g, r16 a c e
    a8 g4 fis8 g4 r16 h, g h
    c8 c, r16 e' c e c8 e f e
    d d16 d g8 g, e'4. e8
    c e d4\trill e16 e, g c e8 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 e'^\tutti e8. e,16 e8 e'
    e8. e,16 e4 e'4. e16 e
    d8 d d8. d16 d g, h d h8 g
    r16 c e g e8 c r c d e
    d d16 d g8 g, e'4. g8
    c, e d4 e r
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi -- num, et ex -- ul -- ta -- vit,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o sa -- lu --
  ta -- ri me -- o.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 g'^\tutti g8. g16 g8 g
    g8. g16 g4 r8 e a a
    a g g fis g4 r16 g g g
    g8 g r16 g a g a8 g f e16 e
    g8 g r4 r8 g g g
    a16 a g g g4 g r
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi -- num, et ex -- ul --
  ta -- vit, et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o
  sa -- lu -- ta -- ri me -- o.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 c^\tutti c8. c16 c8 c
    c8. c16 c4 r8 c c c
    c h a8. a16 h4 r16 d c d
    e8 e r16 e f e f8 c h c16 c
    h8 h r4 r8 c c c
    a16 a c c c8[ h] c4 r
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi -- num, et ex -- ul --
  ta -- vit, et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o
  sa -- lu -- ta -- ri me -- o.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 c'^\tutti c8. c,16 c8 c'
    c8. c,16 c4 c' a8 a
    fis g d8. d16 g,4 r16 g' e g
    c8 c, r16 c' a c f,8 e d c16 c
    g'8 g r4 r8 c, c' e,
    f16 f c c g'4 c, r
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi -- num, et ex -- ul --
  ta -- vit, et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o
  sa -- lu -- ta -- ri me -- o.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti c' c c c8. c,16 c8 c'
    c8. c,16 c4 c' a
    fis8 g d4 g, r16 g' e g
    c8 c, r16 c' a c f,8 e d c
    g' g, r4 r8 c c' e,
    f c g4 c4. h8-\solo
  }
}

BassFigures = \figuremode {
  r1
  r
  <6 5>4 <4>8 <_+>2 <6>8
  r4. q2 <6>4
  r1
  r4 <4>8 <3>2 <6\\>8
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
