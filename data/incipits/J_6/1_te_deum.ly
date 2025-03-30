\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \pa c4 e g4. g8 \pd
    c4 e d4. e16 f
    g4 g8. g16 g4. a16 h
    c4 c, r \pa f~
    f8 a g a \pd h4. a16 h
    c4. h8 a g fis4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 e g4. g8
    e4 g g4. g8
    c4 e8. e16 d4. d8
    g,4 g r c
    d4. d8 d4. c16 d
    e8 d c4 d2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 c8. c16 g4 g
    c c8 c16 c g8 g16 g g g g g
    c4 c8 c g g16 g g8 g
    c c16 c c4 r2
    r g4 g8 g
    c4 r r2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c''8 c, r16 c e c g'8 g, r16 g' h g
    c8 c, r4 r16 g d' h g' d h' g
    c8 c, r4 r16 g d' h g' d h' g
    c8 c, r16 c e g c8 e, r16 a, c e
    f8 a, r16 d a' c h8 g,, r16 d'' g h
    c c, e g c8 c, r16 d fis a d8 d,,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'16 e, g e c'8 g r16 g h g d'8 g,
    r16 g c g e' c g' e d8 g, r4
    r16 g c g e' c g' e d8 g, r4
    r16 e g c e8 g, r16 a c e a8 a,
    r16 d, f a d8 d, r16 g h d g8 g,
    r4 r16 a c e a8 d,, r16 a' d fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c'^\tutti g'2
    g4 e d d8 d
    e4 e16[ f e f] g2
    g,4 g c c8 c
    r4 d8 d d4 d
    r e d d8 d
  }
}

SopranoLyrics = \lyricmode {
  Te De --
  um lau -- da -- mus, lau --
  da -- _ _
  mus, te Do -- mi -- num
  con -- fi -- te -- mur,
  te Do -- mi -- num
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r4 c^\tutti g'2
    g4 g h2
    c4 r r c,
    f8[ a] g a h4 h
    r c8[ h] a4 a8 a
  }
}

AltoLyrics = \lyricmode {
  Te De -- %2
  um lau -- da --
  mus, te
  De -- um lau -- da -- mus,
  te Do -- mi -- num
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 r4 g
    c c8 e d2
    e4 r r a,
    d d8 d r g,4 d'8
    e4 c r d
  }
}

TenoreLyrics = \lyricmode {
  Te %2
  De -- um lau -- da --
  mus, te
  Do -- mi -- num con -- fi --
  te -- mur, te
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 r4 g'
    c c8 c h[ a g f]
    e[ d] c c' h[ a] g f
    e[ d c h] a'[ g f e]
    d'[ c h a] g[ f e d]
    c4 r8 g' fis[ e] d c
  }
}

BassoLyrics = \lyricmode {
  Te
  De -- um lau -- da --
  _ mus, te De -- um lau --
  da -- _
  _ _
  mus, te Do -- mi -- num
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' c c h a g f
    e d c c' h a g f
    e d c c' h a g f
    e d c h a' g f e
    d' c h a g f e d
    c' h a g fis e d c
  }
}

BassFigures = \figuremode {
  r1
  r
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
