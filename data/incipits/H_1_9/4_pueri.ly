\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c''\f g a g c, r4
    r8 a' g16 e f d e f e f g8 f16 e
    d4 r r2
    r8 e d16 h c a h8 g r4
    r8 d' g16 e f d e8 c r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r2 r8 c'\f g a
    g c, r4 r2
    r8 a' g16 e f d e f g4 e'8
    d g, r4 r8 e' d16 h c a
    h8 g r4 r8 g' c16 a b g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'2^\tutti c4 c,8 c'
    c4 c, r8 c' c c
    h4 c8 d e4. e8
    d e d c h[ e] d[ c]
    h8.[ a16] g8[ a16 h] c4. d16[ e]
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te, lau --
  da -- te, lau -- da -- te
  pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men
  Do -- _ _ "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    r2 g'^\tutti
    g4 g,8 g' g4 g,
    r8 g' g g e4 f8 g
  }
}

AltoLyrics = \lyricmode {
  Lau --
  da -- te, lau -- da -- te,
  lau -- da -- te pu -- e -- ri
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti d e f e a g f
    e f e d c c' e, c
    g' f e d c e d c
    h c h a g c h a
    << { g' f e d } \\ { g,4 s } >> c8 b a g
  }
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

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
