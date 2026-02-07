\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Tempo ordinario"
    a''8.\f\trill g32 f e32( c16.) d32( b16.) c8 a r4
    r c8.\p\trill d32 e f4 b,8.\trill c32 d
    e4 a,8.\trill b32 c d4 r
    R1
    a'8.\f\trill g32 f e32( c16.) d32( h16.) \tuplet 3/2 8 { c16 \hA h a } a8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Tempo ordinario"
    f'8.\f\trill e32 d c32( a16.) b32( g16.) a8 f r4
    g8.\trill\p a32 b c4 f,8.\trill g32 a b4
    e,8.\trill f32 g a4 r2
    R1
    c8.\trill\f h32 a \hA h32( e,16.) gis32( \hA h16.) \tuplet 3/2 8 { e,16 d c } c8 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 c'8.[^\solo b32 a] g8 f
    f16[ e] e8 r c' c16[ f,] f8 r b
    b16[ e,] e8 r c' d16[ c d8]~ d16[ e f g]
    e[ d e8]~ \sbOn e16[ f \tuplet 3/2 8 { g f e] } \sbOff f8 e16 d c8( h16.)\trill a32
    a4 r r2
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit in no --
  _ _ mi -- ne Do -- mi --
  ni,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 a8.[^\solo b32 c] d8 d
    d16[ c] c8 r4 r8 f f16[ b,] b8
    r e e16[ a,] a8 r f' g16[ f g8]~
    g16[ a b c] a[ g a8] a16[ gis] a8 a[ \hA gis16.] a32
    a4 r e4. f16[ g]
  }
}

AltoLyrics = \lyricmode {
  Be -- _ ne --
  di -- ctus, qui ve -- nit,
  qui ve -- nit in no --
  _ mi -- ne Do -- mi --
  ni, be -- "ne -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Tempo ordinario"
    f4-\solo r8 b, f'4 b,
    c a d g,
    c f, b h
    c cis d8 f e e,
    a c gis e a a' cis, a
  }
}

BassFigures = \figuremode {
  r2. <6>8 <5>
  <9 4> <8 3>4. <7>4 q
  q q2 <6>4
  r r4. <6>8 <6 4> <5 _+>
  r1
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
