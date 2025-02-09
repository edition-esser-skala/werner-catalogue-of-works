\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro"
    g''2 g g
    g1 g2
    g2. e4 f g
    a2 f a
    h g h
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro"
    e'2 e e
    d d1
    e2 c1~
    c2 d1~
    d2 e1
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Allegro"
    c4 c8 c c4 c c c
    g4. g16 g g4 g g g
    c4. c16 c c4 c c c
    c2 r r
    g r4 g8 g g4 g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro"
    c'4 c, r c' c c
    h d16( c h a) g2 r4 g'
    e g16( f e d) c2 r4 c
    a c16( b a g) f4 a16( g f e) d4 d'
    h d16( c h a) g4 h16( a g f) e4 e'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro"
    c'4 c, r c' c c
    h d16( c h a) g2 r4 g'
    e g16( f e d) c2 r4 c
    a c16( b a g) f4 a16( g f e) d4 d'
    h d16( c h a) g4 h16( a g f) e4 e'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    c'2^\tutti c c
    h d1
    e2 c c
    a d1
    h2 e e
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- tem, fa --
  cto -- rem
  coe -- li et
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    g'2^\tutti g g
    g2 g1
    g2 g4 e f g
    c,2 f1
    d2 g g
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li,
  coe -- li et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    e2^\tutti e e
    d2. h4 c d
    c2 r r4 g
    c a2 f4 r d'
    d h2 g4 r e'
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- _
  tem, fa --
  cto -- _ rem, fa --
  cto -- _ rem "coe -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    c'2^\tutti c,4 c e f
    g2 g, r4 h'
    c2 c, r4 e
    f2 d1
    g2 e e
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, po --
  ten -- tem, fa --
  cto -- rem
  coe -- li et
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Allegro"
    c'4-\tutti c,8 d e4 c e f
    g, g'8 a h4 g a h
    c c,8 d e4 c d e
    f2 r4 d f d
    g2 r4 e g e
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
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
