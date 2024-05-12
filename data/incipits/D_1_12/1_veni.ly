\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e'4\f g8 f e4 c e g
    c, e8 d c4 g c e
    a, c f g a g8 f
    e4 g, c g e' c
    g'4. g,8 g4 h d g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e'4\f g8 f e4 c e g
    c, e8 d c4 g c e
    a, c f g a g8 f
    e4 g, c g e' c
    g'4. g,8 g4 h d g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    c'2^\tutti c4 e c g
    c4. c8 c4 g c2~
    c4 a f2. f4
    e g c g e' c
    g'4. g,8 g2 r
  }
}

SopranoLyrics = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, cre -- a --
  tor Spi -- ri --
  tus, men -- tes tu -- o -- rum
  vi -- si -- ta:
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g'2^\tutti g4 g g h
    e,4. f8 g2 e
    a,4 c d2 c4 d
    c2 r r
    r4 d h d g d
  }
}

AltoLyrics = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, cre --
  a -- tor Spi -- _ ri --
  tus,
  men -- tes tu -- o -- rum
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    e2^\tutti e4 c e d
    c h8[ a] g2. e4
    f2. g4 a g
    g2 r r
    r4 g g h d h
  }
}

TenoreLyrics = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, cre --
  a -- tor Spi -- ri --
  tus,
  men -- tes tu -- o -- rum
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    c'2^\tutti c4 c, c' h
    a g8[ f] e2. c4
    f4. e8 d4 c8[ h] a4 h
    c2 r r
    r4 h d g h g
  }
}

BassoLyrics = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, cre --
  a -- tor Spi -- _ ri -- _
  tus,
  men -- tes tu -- o -- rum
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c4-\tutti e8 d c4 c'2 h4
    a g8 f e2. c4
    f4. e8 d4 c8 h a4 h
    c2 e c
    r4 h g g' h g
  }
}

BassFigures = \figuremode {
  r1.
  r
  r1 <6>2
  r1.
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
