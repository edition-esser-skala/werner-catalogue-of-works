\version "2.24.2"
\include "header.ly"

CornoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    e16 e32 e e16 e e e32 e e16 e g8 g r g'
    a a r a h h r h
    \pa g \tuplet 3/2 8 { g16\trill f g } a8 \tuplet 3/2 8 { a16\trill g a } h8 \tuplet 3/2 8 { h16 a h } c8 h16 a \pd
    g2~\trill g8 a g4\trill
    g r r2
  }
}

CornoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c16 c32 c c16 c c c32 c c16 c e8 e r e'
    c f r f d g r g
    e c4 f8 d g e16 a g f
    e2~\trill e8 c16 f e8 d
    e4 r r2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'32 c, d e f g a h c c, d e f g a h c d e f g a h c c,8 e16( c)
    a( a') a( g) g( f) f( e) d( d') d( c) c( h) h( a)
    g( e) e( d) c( f) f( e) d( g) g( f) e( c') h( a)
    \sbOn \tuplet 3/2 8 { g\trill f g g\trill f g g\trill f g g\trill f g } \sbOff c32( g16.) a32( f16.) e16( d) c( h)
    c32( g16.) a32( f16.) e32( d16.) c32( h16.) c4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'32 c, d e f g a h c c, d e f g a h c d e f g a h c c,8 e16 c
    a( f') f( e) e( d) d( c) h( h') h( a) a( g) g( f)
    e( c) c( h) a( d) d( c) h( e) e( d) c( a') g( f)
    \sbOn \tuplet 3/2 8 { e\trill d e e\trill d e e\trill d e e\trill d e } \sbOff g32( e16.) c32( f16.) e16( d) c( h)
    c32( g16.) a32( f16.) e32( d16.) c32( h16.) c4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    c'8.^\tutti c16 c8 c c c, r c'
    c a r d d h r h
    c[ g a d] h e c[ d]
    \afterGrace e2~ { e16[ f] } g8 f e[ d]
    e r r4 <c e>2^\solo
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei --
  son, __ _ e -- lei --
  son. "Ky -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    g'8.^\tutti g16 e8 e g g r g
    a4. f8 h4. g8
    e g c,[ f] d g e16[ c' h a]
    g2\trill g8 a g4
    g8 r r4 r2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ _ _
  son, e -- lei -- son, e -- lei --
  _ son, e -- lei --
  son.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    e8.^\tutti e16 c8 c e e r e
    a, c r c h d r d
    g,[ c] a4 h8 c c16[ a' g f]
    e8 c r c c4. h8
    c r r4 r2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son, e -- lei --
  _ son, e -- lei -- _
  son.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    c8.^\tutti c16 a'8 a e e r c
    f f, r d' g g, r g
    c[ e] f d g[ e] a h
    c4~ c16[ g e c] e8 f g[ g,]
    c r r4 r2
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei --
  son.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti r a' r e r r16 e c e
    f8 f, r d' g g, r g
    c e f d g e a h
    c16 g e c c' g e c e8 f g g,
    c f g g, c d-\solo e a
  }
}

BassFigures = \figuremode {
  r
  r
  r
  r2. <6 4>8 <5 3>
  r4 <6 4>8 <5 3> r2
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor (C)" "1, 2" }
        \partCombine #'(0 . 10) \CornoI \CornoII
      >>
    >>
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
