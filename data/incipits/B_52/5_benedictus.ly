\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    d''8.\f c32 b a16 e cis a \tuplet 3/2 8 { f e f } d8 f'8.\trill e32 d \gotoBar "4"
    r2 r8 a'16(\p cis,) d( \hA cis) d8
    r b'16( d,) e( d) e8 r2
    r a16\f g32( f) e16 d c b32( a) g16 b
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    d''8.\f c32 b a16 e cis a \tuplet 3/2 8 { f e f } d8 f'8.\trill e32 d \gotoBar "4"
    r2 r8 a'16(\p cis,) d( \hA cis) d8
    r b'16( d,) e( d) e8 r2
    r a16\f g32( f) e16 d c b32( a) g16 b
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1 \gotoBar "4"
    d'8.[^\solo c32 b] a8. g16 f[ e] d8 r f'16[ a,]
    b[ a] b8 r c16[ g] a[ g] a b c4~
    c16[ d] c b a[ g] f[ e] f4 r
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit in no --
  mi -- ne Do -- mi -- ni,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    d8-\solo f cis a d f,16 e d8 d' \gotoBar "4"
    d8 f cis a d, d'16 e f8 d
    g, g' c! c, f d a f
    b d c c, f g a e'
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <6>4
  r8 q <6 4> <5 3>4. <6>4
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
