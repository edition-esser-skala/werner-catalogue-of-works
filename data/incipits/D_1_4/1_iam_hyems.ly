\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \pa r8 c e g c e, g c \pd
    e g, c e g4 r
    r8 g4 c8 \pa h c a h16 a \pd
    gis8 gis r4 r2
    r r8 d e g16 g
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r2 r8 c e g
    c e, g c e4 r
    r8 e4 e8 d e c f
    e e r4 r2
    r r8 g,! g c16 e
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c4 r c r
    c r8 c16 c c4 r
    c r r2
    R1
    r2 r8 g c c16 c
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r16 c\f e c g' e32 g c16 g32 c e16 e, g e c' g32 c e16 c32 e
    g16 g, c g e' c32 e g16 e32 g c16 h32 a g f e d c e d c h a g f
    e c' h a g f e d c16 g' c e d h g' c,~ c a f' d
    h32 e, fis gis a h c d e h c d e fis gis a h16 gis e h gis h gis e
    c'32 d e d c h a g f g a g f e d c h' c d c h a g f e16 g c e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r2 r16 c\f e c e c32 e g16 e32 g
    c16 e, g e c' g32 c e16 c32 e g e d c h a g f e c' h a g f e d
    c c' h a g f e d c16 e g c h g8 c16 a f8 h16
    gis32 e fis? gis a h c d e h c d e fis gis a h16 gis e h gis h gis e
    c'32 d e d c h a g f g a g f e d c h' c d c h a g f e16 g8 c16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 e'^\tutti e e e8. e,16 e4
    e'8. e,16 e4 r2
    r8 e'4 e8 d e16 e c8 d
    h h r4 r r8 e16 h
    c8 e16 c a8 a16 a h8 d16 h g8 c16 e
  }
}

SopranoLyrics = \lyricmode {
  Iam hy -- ems trans -- i -- it,
  trans -- i -- it,
  im -- ber ab -- i -- it et re --
  ces -- sit, et re --
  ces -- sit, re -- ces -- sit, re -- ces -- sit, re -- ces -- sit, "re -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 g'^\tutti g g g8. g16 g4
    g8. g16 g4 r2
    r8 g4 g8 g g16 g f8 f
    e e r4 r r8 gis16 gis
    a8 a16 e f8 d16 f g8 g16 d e8 g16 g
  }
}

AltoLyrics = \lyricmode {
  Iam hy -- ems trans -- i -- it,
  trans -- i -- it,
  im -- ber ab -- i -- it et re --
  ces -- sit, et re --
  ces -- sit, re -- ces -- sit, re -- ces -- sit, re -- ces -- sit, "re -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 c^\tutti c c c8. c16 c4
    c8. c16 c4 r2
    r8 c4 c8 h c16 c a8 h
    gis gis r4 r r8 h16 e
    a,8 c16 c d8 d16 d d8 h16 d c8 c16 c
  }
}

TenoreLyrics = \lyricmode {
  Iam hy -- ems trans -- i -- it,
  trans -- i -- it,
  im -- ber ab -- i -- it et re --
  ces -- sit, et re --
  ces -- sit, re -- ces -- sit, re -- ces -- sit, re -- ces -- sit, "re -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 c^\tutti c' c c8. c,16 c4
    c'8. c,16 c4 r2
    c4. c8 g' e16 e f8 d
    e e r4 r r8 e
    a a,16 a d8 f16 d g!8 g,16 g c8 e16 c
  }
}

BassoLyrics = \lyricmode {
  Iam hy -- ems trans -- i -- it,
  trans -- i -- it,
  im -- ber ab -- i -- it et re --
  ces -- sit, re --
  ces -- sit, re -- ces -- sit, re -- ces -- sit, re -- ces -- sit, "re -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti c c' c c c, c c
    c c, c c c4 r
    c'4. c8 g' e f d
    e4 r r r8 e
    a a, d f16 d g!8 g, c e16 c
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 r8 <6>4 q8
  <_+>2.. q8
  r1
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
