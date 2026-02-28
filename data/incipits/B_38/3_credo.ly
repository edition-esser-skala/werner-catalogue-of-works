\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \pa g''4 a g4. g8
    a4. fis8 \pd g g r4
    R1*4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'4. e8 d4 d
    c8.\trill d32 e d8 d d d r4
    R1*4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8. c32 c c8 c g8. g32 g g8 g
    c4 r r2
    R1*4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'8\f g e c d8\trill e32( f g a) h8 d,
    c16(\trill h c8) a' c, h16 g32 a h16 c d e32 fis g16 a
    h8 g, r4 d16\p e fis a g h a c
    h8 g, r4 r2
    r e''8 c, r4
    g'16 a h d c e d f e8 c, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'8\f g e c d8\trill e32( f g a) h8 d,
    c16(\trill h c8) a' c, h16 g32 a h16 c d e32 fis g16 a
    h8 g, r4 d16\p e fis a g h a c
    h8 g, r4 r2
    r e''8 c, r4
    g'16 a h d c e d f e8 c, r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e'4^\tutti c d h
    r8 c d d d d r4
    R1*2
    r2 g,~
    g e4 f
  }
}

SopranoLyrics = \lyricmode {
  Cre -- do, cre -- do
  in u -- num De -- um,

  cre --
  do in
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g'4^\tutti a g g
    r8 e a fis g g r4
    R1*2
    r2 g~
    g e4 f
  }
}

AltoLyrics = \lyricmode {
  Cre -- do, cre -- do
  in u -- num De -- um,

  cre --
  do in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4.^\tutti e8 d4 d
    r8 c a a h h r4
    d1
    h4 c h a
    d2 e
    R1
  }
}

TenoreLyrics = \lyricmode {
  Cre -- do, cre -- do
  in u -- num De -- um,
  cre --
  do in u -- num
  De -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4^\tutti a h g
    r8 a fis d g g r4
    d'1
    h4 c h a
    d2 e
    R1
  }
}

BassoLyrics = \lyricmode {
  Cre -- do, cre -- do
  in u -- num De -- um,
  cre --
  do in u -- num
  De -- um,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti e' a,, c' h, d' g,, h'
    a, a' fis d g, g' d h
    g h'-\solo a g fis d e \hA fis
    g, g' e fis g e c d
    h a16 g a8 h c e d c
    h g a h c c' a h
  }
}

BassFigures = \figuremode {
  r1
  r2. <\t>4
  r1
  r4 <6>2 <6 5>8 <_+>
  r1
  r2. <6>4
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
