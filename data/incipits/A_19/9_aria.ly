\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/8 \tempoMarkup "Vivace"
    a16\f a' gis a c a
    h, a' gis a c a \gotoBar "23"
    a,4 r8
    \sbOn \tuplet 3/2 8 { h'16\p c d } c32( h16.) a32( gis16.)
    R4.
    \tuplet 3/2 8 { c16 d e } d32( c16.) h32( a16.)
    R4.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/8 \tempoMarkup "Vivace"
    a16\f a' gis a c a
    h, a' gis a c a \gotoBar "23"
    a,4 r8
    \sbOn \tuplet 3/2 8 { gis'16\p a h } a32( \hA gis16.) fis32( e16.)
    R4.
    \tuplet 3/2 8 { c'16 d e } d32( c16.) h32( a16.)
    \tuplet 3/2 8 { f!16 g! a } g32( f16.) e32( d16.)
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/8 \autoBeamOff \tempoMarkup "Vivace"
    R4.*2 \gotoBar "23"
    e8 \tuplet 3/2 8 { a16([ h c)] } h([ a)]
    h4 r8
    e, \tuplet 3/2 8 { h'16([ c d)] } c([ h)]
    c4 e,8
    f([ g)] a
  }
}

SoliLyrics = \lyricmode {
  Herr laß den
  Sieg,
  Herr laß den
  Sieg auf
  je -- ne
}

Continuo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/8 \tempoMarkup "Vivace"
    a16 a' gis a c a
    h, a' gis a c a \gotoBar "23"
    a8 c, a
    e'4 r8
    gis e \hA gis
    a a, c
    d4 f8
  }
}

BassFigures = \figuremode {
  r4.
  <7>
  r
  <_+>
  r
  r
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
        \set Staff.instrumentName = "Debora"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
