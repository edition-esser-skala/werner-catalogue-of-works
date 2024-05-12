\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r32 c\f d e f g a h c16 g e c r32 e f g a h c d e16 c g e
    r32 g a h c d e f g c, d e f g a h c16 g e c r4
    r2 r32 h' a g fis e d c h g' fis e d c h a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r4 r32 c\f d e f g a h c16 g e c r32 e f g a h c d
    e16 c g e r32 e f g a h c d e16 c g e r4
    r2 r32 g' fis e d c h a g h a g fis e d c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 g'^\tutti c g r c e c
    r e g e c e16[ c] g8 e16 g
    e8 c16 e g8 c16 e g8 g, r4
  }
}

SopranoLyrics = \lyricmode {
  E -- sto -- te, e -- sto -- te,
  e -- sto -- te for -- tes, for -- tes in
  bel -- lo, in bel -- lo, in bel -- lo,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 e^\tutti g e r g c g
    r g c g e c' g e16 g
    e8 c16 e g8 c16 c, g'8 g, r4
  }
}

AltoLyrics = \lyricmode {
  E -- sto -- te, e -- sto -- te,
  e -- sto -- te for -- tes, for -- tes in
  bel -- lo, in bel -- lo, in bel -- lo,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 e^\tutti c g r g'
    e c r g c e16[ c] g8 e16 g
    c8 e16 c g8 c16 e g8 g, r4
  }
}

TenoreLyrics = \lyricmode {
  E -- sto -- te, e --
  sto -- te, e -- sto -- te for -- tes in
  bel -- lo, in bel -- lo, in bel -- lo,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 c^\tutti e c r e
    g e r g c e16[ c] g8 e16 g
    e8 c16 c' g8 e16 c g'8 g, r4
  }
}

BassoLyrics = \lyricmode {
  E -- sto -- te, e --
  sto -- te, e -- sto -- te for -- tes in
  bel -- lo, in bel -- lo, in bel -- lo,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4.-\tutti c8 c4. c8
    c4. c8 c c'-\markup \remark "alla 8va" g e16 g
    e8 c16 c' g8 e16 c g'8 g, r4
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
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
