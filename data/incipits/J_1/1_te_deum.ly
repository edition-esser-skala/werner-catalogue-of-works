\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \pa c8 c e g c e16 f g8 d
    e c16 h c8 g16 g c4 g8 g
    e c \pd r4 r2
    r a''8 a16 a a8 g
    g4 r r2
    R1
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 c8 c e g
    c e16 d e8 g,16 g c4 g8 g
    e c r4 r2
    r d'8 d16 d d8 d
    d4 r r2
    R1
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 r8 g c c16 c c8 g
    c4 r8 g c c16 c c8 g
    c4 r r2
    r g8 g16 g g g g g
    g4 r r2
    R1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c''16 h c8 h c e,16 f g8 d
    e c16 h c8 h c e,16 f g8 d
    e c r4 e'8 e a a
    fis fis h h g g4 fis8
    g4 r r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c''16 h c8 h c e,16 f g8 d
    e c16 h c8 h c e,16 f g8 d
    e c e' e c c a a
    d d h h e e a, d
    h4 r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'4^\tutti r8 h c4 c8 h
    c c r h c c16 c c8 h
    c c e e c c a a
    d d h h e e d4
    d8 d16^\solo c h8 a h8. h16 h4
    R1
  }
}

SopranoLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num Pa -- trem
  o -- mnis ter -- ra ve -- ne -- ra --
  tur. Ti -- bi o -- mnes An -- ge -- li,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'4^\tutti r8 g g4 g8 g
    g g r g g g16 g g8 g
    g g r4 e8 e fis fis
    fis fis g g g g g[ fis]
    g h16^\solo a g8 fis g8. g16 g4
    R1
  }
}

AltoLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num
  Pa -- trem ter -- ra ve -- ne -- ra --
  tur. Ti -- bi o -- mnes An -- ge -- li,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    e4^\tutti r8 d e4 e8 d
    e e r d e e16 e e8 d
    e e r4 c8 c d d
    d d d d c c a4
    h r r2
    r r8 a4^\solo h16[ cis]
  }
}

TenoreLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num
  Pa -- trem ter -- ra ve -- ne -- ra --
  tur.
  ti -- bi
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'4^\tutti r8 g c4 c8 g
    c c r g c c16 c c8 g
    c, c r4 a'8 a fis fis
    d d g g c, c d4
    g, r r8 g'4^\solo a16[ h]
    c8 c,4 b'8 a4. g8
  }
}

BassoLyrics = \lyricmode {
  Te, te De -- um lau --
  da -- mus, te Do -- mi -- num con -- fi --
  te -- mur, te ae -- ter -- num
  Pa -- trem ter -- ra ve -- ne -- ra --
  tur. ti -- bi
  coe -- li et u -- "ni -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8-\tutti c, e g c c, e g
    c c, e g c c, e g
    c c, r4 a'8 a fis fis
    d d g g c, c d d,
    g4 r8 d'-\solo g4. f!8
    e4. d8 cis cis'16 h a8 g
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  <_+>2. <4>8 <_+>
  r4. q8 r2
  <6>4. <6->8 <6>2
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
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
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
