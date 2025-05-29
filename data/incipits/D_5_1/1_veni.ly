\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    e8 e16 e e8 e e4
    g8 g16 g g8 g g4
    \pa c16 d e f g8 g g4~
    g8 a16 h c8 h c4
    a a r
    h h r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8 c16 c c8 c c4
    e8 e16 e e8 e e4
    g8 c16 d e8 d16 c d8 d
    e d e16 f g f e4
    r c d
    r d e
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8 c16 c c8. c32 c c4
    c8 c16 c c8. c32 c c4
    c8 c c g16 g g8 g
    c c16 c c8 g c c
    c4 r r
    g r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    r16 g c g e' c g' e c' g e' c
    g' c,, e c g' e c' g e' c g' e
    c'8 c,16 d e8 d16 c h8 a
    g a16 h c8 d e16 g f g
    a, c h c f, a' g a f a g a
    h, d c d g, h' a h g h a h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    r16 g c g e' c g' e c' g e' c
    g' c,, e c g' e c' g e' c g' e
    c'8 c,16 d e8 d16 c h8 a
    g a16 h c8 d e16 g f g
    a, c h c f, a' g a f a g a
    h, d c d g, h' a h g h a h
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    g'4^\tutti e r
    c' g r
    e'4. d16[ c] d8 d
    c[ a16 h] c8 d e4
    r c d
    r d e
  }
}

SopranoLyrics = \lyricmode {
  Ve -- ni,
  ve -- ni,
  ve -- ni San -- cte
  Spi -- _ ri -- tus,
  ve -- ni,
  ve -- ni
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    e4^\tutti c r
    g' e r
    g4. g8 g g
    g4. g8 g4
    r c, f
    r d g
  }
}

AltoLyrics = \lyricmode {
  Ve -- ni,
  ve -- ni,
  ve -- ni San -- cte
  Spi -- ri -- tus,
  ve -- ni,
  ve -- ni
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    c4^\tutti g r
    e' c r
    c4. g8 g d'
    e[ d] c[ h] c4
    a a r
    h h r
  }
}

TenoreLyrics = \lyricmode {
  Ve -- ni,
  ve -- ni,
  ve -- ni San -- cte
  Spi -- ri -- tus,
  ve -- ni,
  ve -- ni
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    c'4^\tutti c, r
    c' c, r
    c'4. h16[ a] g8 f
    e[ f] e[ d] c4
    r f d
    r g e
  }
}

BassoLyrics = \lyricmode {
  Ve -- ni,
  ve -- ni,
  ve -- ni San -- cte
  Spi -- ri -- tus,
  ve -- ni,
  ve -- ni
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c'4-\tutti c, r
    c' c, r
    c'4. h16 a g8 f
    e f e d c e
    f g f e d f
    g a g f e g
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <6>8 q q q4.
  r2.
  r
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
      \Timpani
    }
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
