\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    g''2 g g4 f
    e f g2 g
    g g g
    g f d
    e4 r r2 r
    R1.
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    e'2 c d
    c c d
    e f d
    e d g,
    g4 r r2 r
    R1.
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c2 c g
    c c g
    c g g
    c c g
    c4 r r2 r
    R1.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c'8 g a h c d e c d e f d
    e g, a h c d e c d e f d
    e c d e f d e f g f e d
    e g c h a g f e d4 h'
    c, r r e\p d g
    e r r e c' e,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c'8 g a h c d e c d e f d
    e g, a h c d e c d e f d
    e c d e f d e f g f e d
    e g c h a g f e d4 h'
    c, r r c g d'
    g, r r c e c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato" \autoBeamOff
    c'2 c h
    c c d
    e f d
    c d h
    c r r
    R1.
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae --
  ta -- _ _
  re,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato" \autoBeamOff
    g'2 g g
    g g4 c h a
    g2 g g
    g a g
    g4 c^\solo c h8[ a] g[ a g f]
    e[ f e d] c[ h c d] e[ d e f]
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, __ _ lae -- _
  ta -- re, lae --
  ta -- _ _
  re, lae -- ta -- _ _
  _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato" \autoBeamOff
    e2 e d
    e4 f g2 g4 f
    e2 h d
    e f d
    e r r
    R1.
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na
  coe -- _ li, lae -- _
  ta -- re, lae --
  ta -- _ _
  re,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato" \autoBeamOff
    c2 e g
    c e, g
    c d h
    c f, g
    c, r r
    R1.
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae --
  ta -- _ _
  re,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c2 e g
    c e, g
    c d h
    c f, g
    c, r \mvTr h\p-\solo
    c r c
  }
}

BassFigures = \figuremode {
  r1.
  r
  r2 <6 4 3> <6 5>
  r <6>1
  r1.
  r
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
