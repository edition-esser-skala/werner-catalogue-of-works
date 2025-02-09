\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c16 d32( e f g a h) c8 c, c'4
    g16 a32( h c d e f) g8 g, g'4
    c,16 d32( e f g a h) c8 c, c'4
    h16 c d c h c h a g a g f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    r16 g' e g e8 c32( d e f) g8 e
    r16 d' h d h8 g32( a h c) d8 h
    r16 g' e g e8 c32( d e f) g8 e
    d h r \tuplet 3/2 8 { d16 e f } g a g f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    e'4^\tutti e8 e g e
    d d r d g g
    e e r c c e
    d d r4 r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti g8 g g g
    g g r g g g
    g g r g g g
    g g r4 r
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c4^\tutti c8 c g c
    h h r h d h
    c c r e c c
    h h r4 r
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    c4^\tutti c8 c e c
    g' g, r g' h g
    c c, r c' e, c
    g' g, r4 r
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8-\tutti c, r16 c'' g c e, g c, e
    g8 g, r16 g' d g h, d g, h
    c8 c, r16 c'' g c e, g c, e
    g8 g, r4 r8 \tuplet 3/2 8 { g'16 a h }
  }
}

BassFigures = \figuremode {
  r2.
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
