\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r8 \pa e'16 d e8 g~ g e16 d e8 e
    d d4 d8 d g g g
    e g g g a4 \pd r8 a
    h4 r8 h c4 r8 c
    d4 r8 g, g g g e
    d d r4 r2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r8 c'16 g c8 d c g16 g g8 g
    g g4 d'8 g, d' d d
    c e16 d e8 e c f r f
    d g r g e a r a
    g d r d e d c16 c g e
    g8 g r4 r2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8 c16 g c8 g c c c c16 c
    g8 g16 g g8 r g g16 g g8 g
    c4 r c r
    g r c r
    g r8 g c g c c16 c
    g8 g r4 r2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c''8 c, r16 g' h g c8 c, r16 e g e
    d8 g, r16 d' fis d g8 g, r16 d' g d
    e8 e, r16 e' g e a8 a, r16 f' a f
    h8 h, r16 g' h g c8 c, r16 a' c a
    d8 d, r16 h' d h g8 h c c
    h16 g, h d g d h g r4 h'8 e,,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r16 c' e d e8 d r16 g, e' d c8 e
    r16 g, h a h8 d r16 g, h g h8 d
    r16 e c g e8 c r16 c' f e f8 d,
    r16 d' g f g8 e, r4 a'8 f,
    r4 h'8 g, e'16 g d g c, e g e
    d g, h d g d h g e8 gis' r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 e'16[^\tutti d] e8 d c c16[ d] e4
    d r8 d d d d4
    e r8 c a16[ g] a4 d8
    h16[ a] h8 r e c16[ h] c4 f8
    d16[ c] d8 r g e d c e16 e
    d8 d r4 e8 e e e16 e
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, o -- mni -- po -- ten --
  tem, fa -- cto -- _ rem
  coe -- li, fa -- cto -- _ rem
  coe -- li, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 g'^\tutti g g g g g4
    g r8 fis g g g4
    g8 e16[ d] e8 g c, f4 a8
    d,[ g16 f] g8 h e, a4 c8
    g4. g8 g4 g8 g
    g g r4 e8 gis gis h16 h
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li, fa --
  cto -- _ rem coe -- li, fa --
  cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 g^\tutti c h c e16[ d] c4
    h r8 a h h h4
    c r r8 a a a
    r h h h r c c c
    r d d d c[ h] c c
    h h r4 h8 h h h16 h
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, o -- mni -- po -- ten --
  tem, fa -- cto -- rem,
  fa -- cto -- rem, fa -- cto -- rem,
  fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 c'16[^\tutti h] c8 g e c c'4
    g r8 d h g g'4
    c, r8 e f d r f
    g e r g a f r a
    h g r g c g e c16 c
    g'8 g, r4 gis'8 h e, \hA gis16 gis
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, o -- mni -- po -- ten --
  tem, fa -- cto -- rem, fa --
  cto -- rem, fa -- cto -- rem, fa --
  cto -- rem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti c'16 h c8 g e c c' c,
    g g'16 fis g8 d h g g' g,
    c c'16 h c c, e c f8 d'16 c d d, f d
    g8 e'16 d e e, g e a8 f'16 e f f, a f
    h8 g'16 f g g, h g c8 g e c
    g' g, r4 gis'8 e'16 d e e, \hA gis e
  }
}

BassFigures = \figuremode {
  r1
  r4. <_+>8 <6>2
  r1
  r
  r
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
