\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'16(\f c') h( c) g( c) e,( g) c,( g') e( g) c,( e) g,( c)
    a( c) a( c) a( c) a( c) h( d) h( d) h( d) h( d)
    c( e,) g( c) e( c) g'( e) c'8.\trill h32( c) e,8.\trill d32( e)
    r16 d, g( h) d( h) g'( h,) c8.\trill h32( c) a'8.\trill g32( a)
    r16 h,, e( g) h( g) e'( g,) a8.\trill g32( a) f'8.\trill e32( f)
    r16 g,, c( e) g( e) c'( g) f( f') d( f) h,( d) d,( f)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'16(\f c') h( c) g( c) e,( g) c,( g') e( g) c,( e) g,( c)
    a( c) a( c) a( c) a( c) h( d) h( d) h( d) h( d)
    c( e,) g( c) e( c) g'( e) c'8.\trill h32( c) e,8.\trill d32( e)
    r16 d, g( h) d( h) g'( h,) c8.\trill h32( c) a'8.\trill g32( a)
    r16 h,, e( g) h( g) e'( g,) a8.\trill g32( a) f'8.\trill e32( f)
    r16 g,, c( e) g( e) c'( g) f( f') d( f) h,( d) d,( f)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'2^\tutti g4. g8
    a4 a h2\trill
    c4 r r8 c e c
    g'4 g, r8 a c a
    e'4 e, r8 f a f
    c'4 c,8 g' f2\trill
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem, fa -- cto -- rem
  coe -- li, fa -- cto -- rem
  coe -- li, fa -- cto -- rem
  coe -- li et "ter -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e2^\tutti e4. e8
    f4 f f2\trill
    e4 r r2
    r8 g h g c4 c,
    r8 e g e a4 a,
    r8 c e c a4 h\trill
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem,
  fa -- cto -- rem coe -- li,
  fa -- cto -- rem coe -- li,
  coe -- li et ter -- \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g2^\tutti c4 c
    c c d2
    g,4 r r2
    r8 d' d d c4 a
    r8 h h h a4 f
    r8 g c e r d4 h8
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem,
  fa -- cto -- rem coe -- li,
  fa -- cto -- rem coe -- li,
  fa -- cto -- rem coe -- \hy
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c2.^\tutti c8 c
    c4 c c2
    c4 r r2
    r8 h' h h a4 a,
    r8 g' g g f2
    e4. e8 d4 g
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem,
  fa -- cto -- rem coe -- li,
  fa -- cto -- rem coe --
  li et ter -- \hy
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c c c c c c c
    c c c c c c c c
    c c c c c4 r
    r8 h' h h a2
    r8 g g g f2
    r8 e e e d4 g
  }
}

BassFigures = \figuremode {
  r1
  <6 4>2 <7 4 2>
  <8 3>1
  r1
  r8 <6>2..
  r8 q r2 r4
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
