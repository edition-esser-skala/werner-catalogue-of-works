\version "2.24.2"
\include "header.ly"

SalmoeIeII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    R1*5
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'4-\tutti r8 e16 f g8 g g g
    g4 r8 e16 f g8 g g g
    g4 r8 g a4 r8 a
    h4 r8 g \pa a16 g a h c8.\trill h32 a
    g8 g4 c8 \pd h h r4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4 r8 c d d d d
    e4 r8 c d d d d
    e4 r8 c c4 r8 d
    d4 r8 e c f4 f8
    e d c e d d r4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 r8 c16 c g8 g16 g g8 g
    c4 r8 c16 c g8 g g8. g32 g
    c4 r8 c16 c c4 r
    r r8 g c c16 c c8 c
    c g16 g c g c8 g g r4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e16\f c g' e c' g e' c g'8 d h g
    c e,16 g c g e' c g'8 d h g
    c e4 g8 a, c f a
    h, d g h c, a16 h c h c d
    e f g4 c8 h16 g d g h, d g, h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e16\f c g' e c' g e' c g'8 d h g
    c e,16 g c g e' c g'8 d h g
    c e4 g8 a, c f a
    h, d g h c, a16 h c h c d
    e f g4 c8 h16 g d g h, d g, h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    e'4^\tutti r8 e d4 h8 d
    e e r e d d16 d h8 d
    e e e e c c f f
    d d g e c4. f8
    e d c e d d r4
  }
}

SopranoLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num, te ae --
  ter -- num Pa -- trem o -- mnis
  ter -- ra ve -- ne -- ra -- tur.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'4^\tutti r8 g g4 g8 g
    g g r g g g16 g g8 g
    g g g g a4. a8
    h4. h8 a4. a8
    g g g g g g r4
  }
}

AltoLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num
  Pa -- trem o -- mnis
  ter -- ra ve -- ne -- ra -- tur.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c4^\tutti r8 c d h4 g8
    g e r c' d d16 d d8 h
    g e c' c a f d' d
    h g g g' f[ c]~ c16[ h] c[ d]
    e8 h c c h h r4
  }
}

TenoreLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num, te ae --
  ter -- num Pa -- trem o -- mnis
  ter -- ra ve -- ne -- ra -- tur.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c4^\tutti r8 c' h g4 h8
    c c, r c' h h16 h g8 h
    c c, c e f a d, f
    g h e, g f16[ e f g] a[ g] a[ h]
    c8 g e c g' g, r4
  }
}

BassoLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num, te ae --
  ter -- num Pa -- trem o -- _ mnis
  ter -- ra ve -- ne -- ra -- tur.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8-\tutti c, c c' h16 c d h g a h g
    e f g e c8 c' h16 c d h g a h g
    e f g e c d e c f g a f d e f d
    g a h g e f g e f e f g a g a h
    c8 g e c g' g, r4
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = \markup \center-column { "chalumeau" "1, 2" }
        \new Staff {
          \SalmoeIeII
        }
      >>
    >>
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
