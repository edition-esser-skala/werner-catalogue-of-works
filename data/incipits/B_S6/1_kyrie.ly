\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c e g \tuplet 3/2 8 { c16 e d } c8-! e4
    \tuplet 3/2 8 { d16 f e } d8-! g16. a32 h16. c32 d8 f, f16 f e d
    e4 \grace e8 d4\trill \tuplet 3/2 8 { c16 e d } c8 c16 e a fis
    \tuplet 3/2 8 { g16 h a } g8-! \tuplet 3/2 8 { g16 h a } g8-! fis2
    g4 r g4. fis8
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c e g \tuplet 3/2 8 { c16 e d } c8-! c4
    \tuplet 3/2 8 { h16 d c } h8-! h16. c32 d16. e32 f8 d d16 d c h
    c4. h8 \tuplet 3/2 8 { c16 e d } c8 c16 e a a,
    \tuplet 3/2 8 { h16 d c } h8-! \tuplet 3/2 8 { h16 d c } h8-! a2
    h4 r h4. a8
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c-! e-! g-! c8. c16 e8 e16 e
    d4 r r8 d d4
    e8 e16 e d4\trill c r
    d r r2
    r8 \pa g4 fis8 \pd g4 r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c-! e-! g-! e8. e16 c'8 c16 c
    g4 r r8 g g4
    c8 c16 c g8 g e4 r
    g r r2
    r8 g d' d g,4 r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 r8 g c4 r8 c
    g4 r r r8 g
    c c g g c4 r
    g r r2
    r g4 r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 c e g \tuplet 3/2 8 { c16 e d } c8 c32([ d e f)] g( a h c)
    \tuplet 3/2 8 { d,16 f e } d8 g32([ fis g a]) h( a h c) d8 f, f16-! f( e d)
    e8 c'16 c, g8 h' \tuplet 3/2 8 { c,16 e d } c8-! c16 e a fis
    \tuplet 3/2 8 { g h a } g8-! \tuplet 3/2 8 { g16 h a } g8-! fis32([ g a g)] a( fis e d) c([ h a g)] fis( e d c)
    h16 d g g, a8 fis' g-! g,-! h-! d-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 c e g \tuplet 3/2 8 { c16 e d } c8 c32([ d e f)] g( a h c)
    \tuplet 3/2 8 { h,16 d c } h8 h32([ a h c)] d( c d e) f8 d d16-! d( c h)
    g8 e' h d \tuplet 3/2 8 { c16 e d } c8-! c16 e a a,
    \tuplet 3/2 8 { h d c } h8 \tuplet 3/2 8 { h16 d c } h8 a32([ h c h)] c8 c32[( h a g]) fis[( e d c])
    h16 d g g, a8 fis' g-! g,-! h-! d-!
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 e'4^\tutti d8 e4 r8 e
    d d r4 r8 d d4
    e8 e d4 e r
    R1
    r2 d4. d8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, e -- lei -- son,

  Ky -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 g'4^\tutti g8 g4 r8 g
    g g r4 r8 g g4
    g8 g g4 g r
    R1
    r2 g4. fis8
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, e -- lei -- son,

  Ky -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 c4^\tutti h8 c4 r8 c
    h h r4 r8 h h[ c16 d]
    c8 c c[ h] c4 r
    R1
    r2 h4. a8
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, e -- lei -- son,

  Ky -- "ri -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 c4^\tutti g'8 c,4 r8 c
    g' g r4 r8 g g[ a16 h]
    c8 c, g'4 c, r
    R1
    r2 g'4. d8
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, e -- lei -- son,

  Ky -- "ri -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c e g c e,16 d e8 c
    g' g, h g r g' g a16 h
    c8 c, g' g, c c' e, c'
    h16. h32 g16 .g32 e16. e32 cis16. cis32 d8 fis a d,
    g h16 c d8 d, g g, h d
  }
}

BassFigures = \figuremode {
  r4 <6>8 <_!> r <6>4.
  r4 q r4.. <6 5>16
  r4 <5 4>8 <\t 3> r4 <6>8 <4\+>
  <6>4 <5>8 <7 5> <_+> <6> <6\\> <7 _+>
  r4 <5 4>2 <6>8 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "ob" "1, 2" }
        \partCombine #'(0 . 10) \OboeI \OboeII
      >>
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
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
