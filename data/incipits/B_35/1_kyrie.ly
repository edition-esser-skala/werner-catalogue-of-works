\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \pa e'8 e g8. f32 e \pd d8 d r4
    \pa e8 g4 c8 \pd h h r4
    g8 g4 g8 f4 r
    a8 a4 a8 g g16 g g4
    r16 g8 g16 g4 r16 g8 c16 h4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c4 c8 g g r4
    c8 e c e d d r4
    c8 c4 c8 c4 r
    d8 d4 d8 d d16 d d4
    r16 c8 e16 d4 r16 c8 e16 d4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8. c32 c c8 c g g r4
    c8. c32 c c8 c g g r4
    c8. c32 c c8 c c4 r
    r2 g8 g16 g g4
    r16 c32 c c16 c g4 r16 c32 c c16 c g4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \sbOn c16 c' \tuplet 3/2 8 { c h c } c, c' \tuplet 3/2 8 { c h c } h8 d g, h
    c16 c' \tuplet 3/2 8 { c h c } c, c' \tuplet 3/2 8 { c h c } h8 h d h
    g(-. g-.) g-.( g-.) f32( g a g) f8 f32( g a g) f8
    a8(-. a-.) a(-. a-.) g32( a h a) g8 g32( a h a) g8
    e32( f) g8 e16 d8 r e32( f) g8 e16 d8 g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 \sbOn g'16 g' \tuplet 3/2 8 { g f g } g, g' \tuplet 3/2 8 { g f g }
    e8 g c, e d16 g \tuplet 3/2 8 { g f g } g, d' \tuplet 3/2 8 { d c d } \sbOff
    e8(-. e-.) c(-. c-.) c16( f) f( c) a32( b c \hA b) a8
    fis'8(-. fis-.) d(-. d-.) d16( g) g( d) h32( c d c) h8
    c16 g8 c16 h8 r c16 g8 c16 h8 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'8.^\tutti c16 c8 c h h r4
    e8. e16 e8 e d d r d
    e2 f4 r8 f
    fis2 g4 r8 d
    e4 d8 g e4 d8 g
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e --
  lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'8.^\tutti g16 g8 g g g r4
    g8. g16 g8 g g g r g
    g2 a4 r8 a
    a2 h4 r8 h
    g[ c] h g g4 g8 g
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e --
  lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e8.^\tutti e16 e8 e d d r4
    c8. c16 c8 c h h r h
    c2 c4 r8 c
    d2 d4 r8 g,
    g4 g8 d' c4 h8 d
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e --
  lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c8.^\tutti c16 e8 c g' g, r4
    c8 c' e, c g' g, r g'
    c4 b a r8 a
    d4 c h r8 g
    c[ c,] g' g c[ c,] g' g
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son, e --
  lei -- _ son, e --
  lei -- son, e -- lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' e, c g g' h, g
    c, c' e, c g' g' h g
    \sbOn c,16 c' \tuplet 3/2 8 { c h c } c, b' \tuplet 3/2 8 { b a b } \sbOff a f c a f' c a f
    \sbOn d' d' \tuplet 3/2 8 { d c d } d, c' \tuplet 3/2 8 { c h c } \sbOff h g d h g' d h g
    c e g c g d h g c e g c g d h g
  }
}

BassFigures = \figuremode {
  r1
  r
  r4. <\t>8 <6>2
  <_+>4. <\t>8 <6>2
  r8 <\t> <3>4. <\t>8 <3>4
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
