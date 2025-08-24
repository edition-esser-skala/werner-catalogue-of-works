\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegretto"
    c8\f \tuplet 3/2 8 { e16 d c } g'8 \tuplet 3/2 8 { h16 a g } c8 \tuplet 3/2 8 { e16 d c } c'4~
    c16 a-! g-! f-! e-! d-! c-! h-! c c, e g c e g c
    h g d h g d h g r2
    \sbOn r8 \tuplet 3/2 8 { g'16\trill f g h\trill a h d\trill c d g\trill f g e\trill d e c\trill h c g\trill f g } \sbOff
    e4 r16 e\p g c a32( c16.) g32( c16.) a32( c16.) f32( a,16.)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegretto"
    c8\f \tuplet 3/2 8 { e16 d c } g'8 \tuplet 3/2 8 { h16 a g } c8 \tuplet 3/2 8 { e16 d c } r8 g'
    a16-! f-! e-! d-! c-! f,-! e-! d-! e c e g c e g c
    h g d h g d h g r2
    \sbOn r8 \tuplet 3/2 8 { g'16\trill f g h\trill a h d\trill c d g\trill f g e\trill d e c\trill h c g\trill f g } \sbOff
    e4 r16 c\p \tuplet 3/2 8 { e\trill d e } f32( a16.) e32( c16.) f16 a8 f16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    R1
    r2 c'8.^\tutti c16 e8 e
    d d r d^\solo es f4 \hA es8
    d g,^\tutti h d g4 g,
    r8 g^\solo c2 c,4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- _ _
  son, Chri -- ste e -- lei -- son,
  e -- lei -- son,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    R1
    r2 g'8.^\tutti g16 g8 g
    g g r g^\solo g2\trill
    g4 r r8 e!^\tutti g d
    e e r4 r2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, Chri -- ste e --
  lei -- son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    R1
    r2 e8.^\tutti e16 c8 c
    h h r h^\solo c8 d4 c8
    h4 r r8 c^\tutti c h
    c c r4 r2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- _ _
  son, Chri -- ste e --
  lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    R1
    r2 c'8.^\tutti c16 c,8 c'
    g g r g^\solo c,[ h] c4
    g r r8 c^\tutti e! g
    c c, r4 r2
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei -- _
  son, Chri -- ste e --
  lei -- son,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegretto"
    c8-\solo c' h h, a a' e, e'
    f4 g c,4.-\tutti c'8
    g g r g-\solo c, h c4
    g r r8 c-\tutti e! g
    c c, r4 r2
  }
}

BassFigures = \figuremode {
  r1
  <5>8 <6> <6 4> <5 3> r2
  r <_->8 <5> <9 4> <8 _->
  r1
  r
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
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
