\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    g''4. g8 c4
    h4. h8 h4
    c c g
    a4. a8 a4
    \pao a a a
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    e'4. e8 e4
    d4. d8 d4
    e e e
    c4. c8 c4
    r e e
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8 c16 g c8 c c4
    g8 g16 g g8 g g4
    c8 c16 c c8 c c4
    c8. c32 c c8 c16 c c4
    R2.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    \tuplet 3/2 8 { c'16 h c } c,8 \sbOn r \tuplet 3/2 8 { e'16 d e g f g c h c }
    h32( c d c) h8 r \tuplet 3/2 8 { h,16 a h d c d g f g }
    e32( f g f) e8 r \tuplet 3/2 8 { e16 d e g f g c h c }
    a32( b c b) a8 r \tuplet 3/2 8 { c,16 h c f e f a g a }
    e32( f g f) e8 r \tuplet 3/2 8 { cis16 h! cis e d e a g a }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    r4 \sbOn \tuplet 3/2 8 { c'16 h c g f g c h c e d e }
    g32( a h a) g8 r \tuplet 3/2 8 { d,16 c d g f g h a h }
    c32( d e d) c8 r \tuplet 3/2 8 { g16 f g c h c e d e }
    f32( g a g) f8 r \tuplet 3/2 8 { a,16 g a c h c f e f }
    cis32( d e d) cis8 r \tuplet 3/2 8 { e,16 d e a g a cis h cis }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    e'4.^\tutti e8 e4
    d4. d8 d4
    e e e
    c4. c8 c4
    cis cis cis
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e
  e -- lei -- son,
  Ky -- ri -- e
  e -- lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    g'4.^\tutti g8 g4
    g4. g8 g4
    g g e
    f4. f8 f4
    e e e
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e
  e -- lei -- son,
  Ky -- ri -- e
  e -- lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    c4.^\tutti c8 c4
    h4. h8 h4
    c c c
    a4. a8 a4
    a a a
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e
  e -- lei -- son,
  Ky -- ri -- e
  e -- lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    c'4.^\tutti c,8 c4
    g'4. g,8 g4
    c' c c,
    f4. f8 f4
    a a a,
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e,
  Ky -- ri -- e
  e -- lei -- son,
  Ky -- ri -- e
  e -- lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c8-\tutti c'16 h c8 c, c' c,
    r g'16 f g8 g, g' g,
    r c'16 h c8 c, c' c,
    r f16 e f8 f, f' f,
    r a'16 g a8 a, a' a,
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r8 <_+> r2
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
      \set Staff.instrumentName = \transposedTimp "C" "" "G" ""
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
