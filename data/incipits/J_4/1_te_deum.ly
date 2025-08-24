\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    \pa g'4 c2 e g4~
    g e c e2 g4~
    g e c e2 g4~
    g e2 \pd e8 d e4 e
    d d8 d d4 d d2
    R1.
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e2 g c4 d
    c g e c c' d
    c g e c c' d
    c g c g8 g g4 g
    g g8 g g4 g g2
    R1.
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c2 c c4 g
    c2 c4 c8 g c4 g
    c2 c4 c8 g c4 g
    c c8 g c4 c8 g c4 c
    g g8 g g4 g g2
    R1.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e'4\f e8 d e4 e8 d e4 g
    c8 c, e g e4 e8 d e4 g
    c8 c, e g e4 e8 d e4 g
    c g2 e4 g c
    h h8 a h4 h8 a h4 a
    g8 g, h d h4 h'8 a h4 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    e'4\f e8 d e4 e8 d e4 g
    c8 c, e g e4 e8 d e4 g
    c8 c, e g e4 e8 d e4 g
    c g e c e e
    d h'8 a h4 h8 a h4 a
    g8 g, h d h4 h'8 a h4 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    r2 r r4 h'^\tutti
    c2 c r4 h
    c2 c r4 h
    c2 c4 c c e
    d2 d r
    r4 d2 d4 d d
  }
}

SopranoLyrics = \lyricmode {
  Te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con --
  fi -- te -- mur,
  te ae -- ter -- num
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    r2 r r4 g'^\tutti
    g2 g r4 g
    g2 g r4 g
    g2 g4 g g g
    g2 g r
    r4 g2 g4 g fis
  }
}

AltoLyrics = \lyricmode {
  Te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur,
  te ae -- ter -- num
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    r2 r r4 d^\tutti
    e2 e r4 d
    e2 e r4 d
    e2 e4 e e c
    h2 h r
    r4 h2 h4 h a
  }
}

TenoreLyrics = \lyricmode {
  Te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur,
  te ae -- ter -- num
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
    r2 r r4 g'^\tutti
    c2 c r4 g
    c2 c, r4 g'
    c2 c4 c c c,
    g'2 g r
    r4 g2 g4 g d
  }
}

BassoLyrics = \lyricmode {
  Te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur,
  te ae -- ter -- num
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c4-\tutti c'8 h c4 c8 h c4 g
    e c r c'8 h c4 g
    e c r c'8 h c4 g
    e c8 h c4 c'8 h c4 c,
    g g'8 fis g4 g8 \hA fis g4 d
    h g r g'8 fis g4 d
  }
}

BassFigures = \figuremode {
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
      \set StaffGroup.instrumentName = \markup \center-column { "org" "b" }
      \new Staff {
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
