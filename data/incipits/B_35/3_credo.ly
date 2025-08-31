\version "2.24.2"
\include "header.ly"

sbFourOn = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/4)
  \set beatStructure = #'(2 2 2)
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    g''2. g4 g c
    h2 r4 g g g
    g2 r4 g g g
    a2 r4 a a a
    h2 r4 h h h
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e'2 c e
    d r4 d d d
    e2 r4 c c c
    c2 r4 d d d
    d2 r4 e e e
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c4. c16 c c4 c c c
    g4. g16 g g4 g g g
    c2 r4 c8 c c4 c8 c
    c2 r r
    R1.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    \sbFourOn c'16(\f d e f) g( a h c) c,4 r c16( d e f) g( a h c)
    h4 r g,16( a h c) d( e fis g) g,4 r
    c,16( d e f!) g( a h c) c,4 r c16( d e f) g( a h c)
    a4 r a16( h c d) e( f g a) a,4 r
    h16( c d e) f( g a h) h,4 r g16( a h c) d( e f g)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    r2 \sbFourOn c'16( d e f) g( a h c) c,4 r
    g16( a h c) d( e fis g) g,4 r g16( a h c) d( e f g)
    e4 r c,16( d e f) g( a h c) e,4 r
    f16( g a b) c( d e f) f,4 r d16( e f g) a( h c d)
    h4 r e,16( f g a) h( c d e) e,4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    e'2^\tutti c e
    d g1
    e2 e r
    c c4 d d d
    d2 e4 e e e
  }
}

SopranoLyrics = \lyricmode {
  Cre -- do in
  u -- num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    g'2^\tutti g g
    g1 g2
    g g r
    f f4 f a f
    d2 d4 g h g
  }
}

AltoLyrics = \lyricmode {
  Cre -- do in
  u -- num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    c2^\tutti c c
    h d h
    c c r
    a a4 a a a
    h2 h4 h h h
  }
}

TenoreLyrics = \lyricmode {
  Cre -- do in
  u -- _ num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
    c2^\tutti e c
    g' h g
    c c, r
    f f4 d f d
    g2 g4 e g e
  }
}

BassoLyrics = \lyricmode {
  Cre -- do in
  u -- _ num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c2-\tutti e c
    g' h g
    c e, c
    f2. d4 f d
    g2. e4 g e
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r1 <6>2
  r q1
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
