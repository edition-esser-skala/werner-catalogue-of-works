\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r2 g'4.-\tutti g8
    g g g g r g\p g g
    g g g g r4 r8 a\f
    f d h'4 g r8 c
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r2 c4-\tutti d8 h
    c c h h r c\p d h
    c c h h r4 a\f
    d4. h8 h4 c
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r2 g''8. g16 d'8 h
    g e' d d g,8.\p g16 d'8 h
    g e' d d r4 r8 a\f
    f d h'4 g r8 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1*2
    r2 e'4 g8 g
    e e d d e4\p g8 g
    e e d d r e\f c a
    f'4 d r8 g e c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'2 e4 f
    e d g2
    a e'4^\tutti g8 g
    e e d d r e\p g g
    e e d d r e\f c a
    f'4 d r8 g e c
  }
}

SopranoLyrics = \lyricmode {
  Cre -- do in
  u -- num De --
  um, Pa -- trem o --
  mni -- po -- ten -- tem, Pa -- trem o --
  mni -- po -- ten -- tem, fa -- cto -- rem
  coe -- li, fa -- cto -- rem
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'2 e4 f
    e d g2
    a g4^\tutti g8 g
    g g g g r g\p g g
    g g g g r4 r8 a\f
    f d h'4 g r8 c
  }
}

AltoLyrics = \lyricmode {
  Cre -- do in
  u -- num De --
  um, Pa -- trem o --
  mni -- po -- ten -- tem, Pa -- trem o --
  mni -- po -- ten -- tem, fa --
  cto -- rem coe -- li, "fa -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    r2 c4^\tutti d8 h
    c c h h r c\p d h
    c c h h r4 a\f
    d4. h8 h4 c
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem, Pa -- trem o --
  mni -- po -- ten -- tem, fa --
  cto -- rem coe -- li,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    r2 c'4^\tutti h8 g
    c e, g g, r c'\p h g
    c e, g g, r c'\f a f
    d[ d'] h4 r8 e, c' a
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem, Pa -- trem o --
  mni -- po -- ten -- tem, fa -- cto -- rem
  coe -- li, fa -- cto -- rem
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\solo e h g c c' a h
    c c, f g e d c d16 e
    f8 g a h c-\tutti c, h g
    c e g g, c\p c' h g
    c e, g g, c\f c' a f
    d d' h g e e' c a
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r <6 5>2.
  r1
  r
  r
  r2 <5>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
