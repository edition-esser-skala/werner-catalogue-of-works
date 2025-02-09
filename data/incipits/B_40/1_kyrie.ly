\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'4 r c r
    e r g8. g16 e8 g \gotoBar "9"
    g8. g16 g8 g \pa g g4 c8 \pd
    h h r4 r2
    R1
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    e4 r g r
    c r e8 d c e \gotoBar "9"
    e8. e16 e8 d c e c e
    d d r4 r2
    R1
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c4 r c r
    c r c8 g16 g c8 g \gotoBar "9"
    c8. c32 c c8 g c c16 c c g c c
    g8 g r4 r2
    R1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
      \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
    e16 e32 e e16 g e32 c d e f g a h c16 c32 c c16 e c32 e, f g a h c d
    e16 e32 e e16 g e32 c d e f g a h c8:32 h: a: g: \gotoBar "9"
    c16 g e g e g d g c g e g c g e c
    d32 h c d e fis g a h16 g d h r2
    r16 d,\p d( f!) f( e) e( g) g( f) d'( f,) f( e) c'( e,)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
      \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16)
    c16 c32 c c16 e c32 g h c d e f g e16 e32 e e16 g e32 c d e f g a h
    c16 c32 c c16 e c32 e, f g a h c d e8:32 d: c: h: \gotoBar "9"
    e16 g e g e g d g c, g' e g c g e c
    h32 g a h c d e fis g16 d h g r2
    r16 h,\p h( d) d( c) c( e) e( d) h( d) d( c) e( c)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2 \gotoBar "9"
    e'8.^\tutti e16 e8 d c e16 e g8 e16 e
    d8 d r d e d16 c d8 c16 e
    d8 d r4 r2
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e -- lei -- son, e --
  lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2 \gotoBar "9"
    g'8.^\tutti g16 g8 g g g16 g g8 g16 g
    g8 g r g g g16 g g8 g16 g
    g8 g r4 r2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e -- lei -- son, e --
  lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2 \gotoBar "9"
    c8.^\tutti c16 c8 h c c16 c c8 c16 c
    h8 h r h c h16 c h8 g16 c
    h8 h r4 r2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e -- lei -- son, e --
  lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*2 \gotoBar "9"
    c'8.^\tutti c16 c8 g e c16 c' e,8 c16 e
    g8 g, r g' c g16 e g8 e16 c
    g'8 g, r4 r2
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e -- lei -- son, e -- %9
  lei -- son, e -- lei -- son, e -- lei -- son, e --
  lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c4-\solo r c r
    c r c8 g' a e \gotoBar "9"
    c-\tutti c'16 c c8 g e c16 c' e,8 c16 e
    g8 g, r4 r2
    g8-\tasto r g r g r g r
  }
}

BassFigures = \figuremode {
  r1
  r2.. <5>8
  r1
  r
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
        \set Staff.instrumentName = "b"
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
