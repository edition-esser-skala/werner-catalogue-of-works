\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c16 d e f g d c e g c h d g, h
    c g f e d8 h' c4 r
    r8 d,\p c h e g, f e
    d4 r r8 g a b
    a16( b) c8 \hA b a g16( a) \hA b8 a g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c16 d e f g d c e g c h d g, h
    c g f e d8 g e4 r
    r8 d\p c h c e, d c
    h4 r r8 e f g
    f16 g a8 g f e16( f) g8 f e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e'4.^\tutti d8 e4 d8 d
    c c c[ h] c e^\solo d c
    g'16[ fis] g4 g,8 g2\trill
    g8 h c d c2~
    c2. c,4
  }
}

SopranoLyrics = \lyricmode {
  Cre -- do, cre -- do in
  u -- num De -- um, Pa -- trem o --
  mni -- _ po -- ten --
  tem, fa -- cto -- rem coe --
  li,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'4.^\tutti g8 g4 g8 g
    g g g4 g r
    R1*3
  }
}

AltoLyrics = \lyricmode {
  Cre -- do, cre -- do in
  u -- num De -- um,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4.^\tutti d8 c4 h8 h
    c e d4 e r
    R1*3
  }
}

TenoreLyrics = \lyricmode {
  Cre -- do, cre -- do in
  u -- num De -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4.^\tutti h8 c4 g8 g
    e c' g4 c, r
    R1*3
  }
}

BassoLyrics = \lyricmode {
  Cre -- do, cre -- do in
  u -- num De -- um,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' c h c c, g g'
    e c g' g, c4 r
    R1
    \mvTr g8\p-\solo g'4 f8 e c r4
    f r c r
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r8 <3> <4 2> r <6>2
  r1
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
