\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    r4 a'\f c f a g
    a f8 c a4 c8 f a4 g
    a f8 c a4 c f a
    g c e, g c,2
    r r a'4 f
    h2 h, \hA h'4 g
    c a2 f4 d g~
    g e d2. g4
    e c e g c c,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    r4 f\f a c f e
    f c8 a f4 a8 c f4 e
    f c8 a f4 g a8 c f4
    e2 c r
    c4 a d2 d
    d4 h e2 e
    c4 c d d h h
    c c c2 h
    c2. d4 e8 f e f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Allegro" \autoBeamOff
    c'2^\tutti c c4 c
    c2 c r4 c
    c2 c4 c c f
    e2 e r
    c4 a d2 d
    d4 h e2 e
    c4 c d d h h
    c c c2 h
    c1 r2
  }
}

SopranoLyrics = \lyricmode {
  Te De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur,
  te ae -- ter -- num,
  te ae -- ter -- num
  Pa -- trem o -- mnis ter -- ra
  ve -- ne -- ra -- _
  tur.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "Allegro" \autoBeamOff
    f2^\tutti f f4 e
    f2 f r4 e
    f2 f4 e f a
    g2 g g4 e
    c2 f1
    d2 g1
    e4 e a a g g
    g g g1
    g r2
  }
}

AltoLyrics = \lyricmode {
  Te De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur, te ae --
  ter -- num
  Pa -- trem,
  Pa -- trem o -- mnis ter -- ra
  ve -- ne -- ra --
  tur.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \tempoMarkup "Allegro" \autoBeamOff
    a2^\tutti a a4 g
    a2 a r4 g
    a2 a4 g c c
    c2 c r
    r a4 f a a
    h2. g4 \hA h h
    c c f f d d
    e e d1
    e r2
  }
}

TenoreLyrics = \lyricmode {
  Te De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur,
  te ae -- ter -- num
  Pa -- trem o -- mnis
  ter -- ra, o -- mnis ter -- ra
  ve -- ne -- ra --
  tur.
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Allegro" \autoBeamOff
    f2^\tutti f f4 c
    f2 f r4 c
    f2 f4 c' a f
    c'2 c, e4 c
    f2 f f4 d
    g2 g g4 e
    a a f f g g
    e c g1
    c r2
  }
}

BassoLyrics = \lyricmode {
  Te De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur, te ae --
  ter -- num, te ae --
  ter -- num Pa -- trem
  o -- mnis, o -- mnis ter -- ra
  ve -- ne -- ra --
  tur.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    f,2-\tutti f'2. c4
    f,2 f'2. c4
    f,2 f'4 c a f
    c'2 c'4 g e c
    f,2 f'2. d4
    g,2 g'2. e4
    a a f f g g
    e c g1
    c2. h4-\solo a a'
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  r2 <6>1
  <_!>2 <6>1
  r1 <_!>2
  r <4> <_!>
  r1.
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
      \set StaffGroup.instrumentName = \markup \center-column { "org" "b" }
      \new Staff {
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
