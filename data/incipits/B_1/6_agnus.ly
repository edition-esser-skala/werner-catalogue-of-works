\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 g'' g g \pa a4. g8 \pd
    g g16 g g4 r8 g g g
    f a a c h4 r
    R1*2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 e' e e f c f e
    d d16 d d4 r8 e e e
    f4 e e r
    R1*2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c8. c32 c c8 c c c16 c c8 c
    g16 g32 g g16 g g4 r2
    R1*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 \sbOn \tuplet 3/2 8 { e'16\trill d e g\trill f g c\trill h c a\trill g a f\trill e f a\trill g a c\trill h c
    h\trill a h } g d \tuplet 3/2 8 { h\trill a h } g8 r16 g' \tuplet 3/2 8 { g\trill f g } r g \tuplet 3/2 8 { g\trill f g }
    r f \tuplet 3/2 8 { f\trill e f } r a \tuplet 3/2 8 { a\trill gis a } \sbOff gis h e, gis h, e gis, h
    \tuplet 3/2 8 { e,\p a cis } e8 \tuplet 3/2 8 { a,16 cis e } a8 \tuplet 3/2 8 { d,,16 f a } d8 \tuplet 3/2 8 { f,16 a d } f8
    \tuplet 3/2 8 { d,16 g h } d8 \tuplet 3/2 8 { g,16 h d } g8 \tuplet 3/2 8 { c,,!16 e g } c8 \tuplet 3/2 8 { e,16 g c } e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 \sbOn \tuplet 3/2 8 { g'16\trill f g c\trill h c e\trill d e c\trill h c a\trill g a c\trill h c e\trill d e
    d\trill c d } h g \tuplet 3/2 8 { d\trill c d } h8 r16 cis' \tuplet 3/2 8 { cis\trill h cis } r e \tuplet 3/2 8 { e\trill d e }
    r a, \tuplet 3/2 8 { a\trill g a } r c \tuplet 3/2 8 { c\trill h c } \sbOff h h' e, gis h, e gis, h
    e,16.\p a32 cis16. e32 r16 a, cis16. e32 f16. d32 a16. f32 d'16. a32 f16. d32
    r16 g h16. d32 r16 g, h16. d32 e16. c32 g16. e32 c'16. g32 e16. c32
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti c8 c c4 c8
    h4 h8 h cis4. cis8
    d4 c h r
    e4.\p a,8 f'4 f
    d4. g,8 e'4 e
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\tutti g8 a4 a8 g
    g4 g r8 g g g
    f4 e2 r4
    a\p a a4. d,8
    g4 g g4. c,8
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4.^\tutti e8 c4 f8 e
    d4 d r8 e e e
    a,2 gis4 r
    r8 a[\p cis] e a,4 d
    r8 g,[ h] d g,4 c
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c4.^\tutti c8 f4 f8 c
    g'4 g, r8 e' e e
    d4 a e' r
    cis4.\p cis8 d4 d
    h4. h8 c4 c
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c4.-\tutti c8 f4. c8
    g'4 g, r8 e' e e
    d4 a e' r
    cis8\p cis cis cis d d d d
    h h h h c c c c
  }
}

BassFigures = \figuremode {
  r1
  r2 r8 <6\\>4.
  r2 <_+>
  <6>1
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
