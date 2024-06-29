\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r4 e'2
    g g8 f
    e4 g e
    d d d
    g4. g8 g g
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    r4 c'2
    d2 d4
    g,2 g4
    g g'2
    c,4. c8 c c
  }
}

ViolinoIeII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c'16 g e c c' g e c c' g e c
    g'' d h g g' d h g g' d h g
    c' g e c c' g e c c' g e c
    h' g d h h' g d h h' g d h
    g' e c g g' e c g g' e c g

  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 e'2^\tutti
    g4 g g
    e g e
    d d h
    g' g8 g g g
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 g'2^\tutti
    g4 g g
    g g g
    g g g
    g g8 g g g
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c2^\tutti
    d4 h d
    c g c
    h h d
    c c8 c c c
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c'2^\tutti
    h4 g h
    c e, c
    g' g g
    e e8 e e e
  }
}

SATBLyrics = \lyricmode {
  Te
  De -- um, te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- "fi -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c4-\tutti c c
    h g h
    c e c
    g' g g
    e e e
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <6>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoIeII
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoIeII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SATBLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \SATBLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \SATBLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \SATBLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
