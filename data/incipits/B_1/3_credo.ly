\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    g''4. g8 g c
    h4 r8 g16 g g8 g
    g4 r8 g g c
    a4 r8 g a a
    a4 r8 fis16 fis fis8 fis
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    e'4. d8 c e
    d4 r8 d16 d d8 d
    e4 r8 d c e
    f4 r8 e f f
    d4 r8 d16 d d8 d
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante"
    c8 c16 g c8 g c c16 c
    g4 r8 g16 g g8. g32 g
    c4 r8 g16 g c8. c32 c
    c4 r r
    R2.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    e'32( f g f) e8 r d c c'
    h32( c d c) h8 r h, d g
    e32( f g f) e8 r g g c
    a32( h c h) a8 r e f a
    fis32( g a g) fis8 r fis a d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    c'32(\f d e d) c8 r g4 e'8
    d32( c h c) d8 r d, g h
    c32( d e d) c8 r d c e
    f32( g a g) f8 r c c f
    d32( e fis e) d8 r d d fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    e'4^\tutti e8 d c e
    d d r d d d
    e e r h c c
    c c r4 c8 a
    d4 d8 d d d
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    g'4^\tutti g8 g g g
    g g r g g g
    g g r g g e
    f f r4 f8 f
    fis4 fis8 fis fis fis
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    c4 c8 h c c
    h h r h g h
    c c r d c e
    a, a r4 a8 a
    a4 a8 a a a
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    c'4^\tutti c8 g e c
    g' g, r d'' h g
    c c, r g' e c
    f f, r4 f'8 f
    d4 d8 d d d
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li, coe -- li et
  ter -- rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante"
    c8-\tutti c'16 h c8 g e c
    r g'16 f g8 d h g
    r c'16 h c8 g e c
    r f16 e f8 c a f
    r d''16 c d8 a fis d
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r8 <_+>4 <\t>4.
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
