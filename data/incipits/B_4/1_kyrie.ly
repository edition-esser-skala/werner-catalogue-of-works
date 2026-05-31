\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \pa e'8 e16 f g8 g \pd g g r4
    \pa e8 e16 f g8 g \pd f f r a
    g g r g e e r a
    g g r g g2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c c e d d r4
    c8 c c e c c r f
    d d r d c c r f
    d d r d e e d d
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 c16 c c8 c g g r4
    c8 c16 c c8 c c c r4
    R1
    r4 r8 g c c16 c g g32 g g16 g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 c'' c, c c32 d e f g a h c h16 g g, g g32 a h c d e f g
    e16 c' c, c c32 d e f g a h c a g f e d c h a f' e d c h a g f
    h' a g f e d c h g' f e d c h a g c' h a g f e d c a' g f e d c h a
    d' c h a g f e d h' a g f e d c h e16 c32 d e16 f g g32 a h16 g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 c'' c, c c32 d e f g a h c h16 g g, g g32 a h c d e f g
    e16 c' c, c c32 d e f g a h c a g f e d c h a f' e d c h a g f
    h' a g f e d c h g' f e d c h a g c' h a g f e d c a' g f e d c h a
    d' c h a g f e d h' a g f e d c h e16 c32 d e16 f g g32 a h16 g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'8.^\tutti c16 c8 e d d r4
    c8. c16 c8 e c c r d
    d d r e e e r f
    g g r d e e r d
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'8.^\tutti g16 g8 g g g r4
    g8. g16 g8 g a a r a
    g g r h a a r a
    g g r g g g r g
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    e8.^\tutti e16 c8 c h h r4
    e8. e16 c8 c c c r a
    h h r h c c r c
    d d r d c c r h
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'8.^\tutti c16 e,8 c g' g r4
    c8. c16 e,8 c f f r f
    g g, r g' a a, r a'
    h h, r h' c c, r g'
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' e, c g g' h, g
    c c' e, c f, f' d f
    g, g' e g a, a' f a
    h, h' g h c, c' h g
  }
}

BassFigures = \figuremode {
  r1
  r2.. <6>8
  r4. q2 q8
  q1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimp "C" "" "G" ""
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
