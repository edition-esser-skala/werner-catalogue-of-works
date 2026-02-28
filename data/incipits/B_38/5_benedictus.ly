\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Ariose"
    r2 r8 f\p c'16( b) c8
    r4 r8 e f8.\trill e32 d c8 b
    a r r4 r8 c c16( h) h8
    r b b16( a) a8 r g' g16( fis) fis8
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Ariose"
    r2 r8 a'\p f a
    r4 r8 c16 b a8 f g16( f) g8
    c, r r4 r r8 f
    f16( e) e8 r d d16( cis) cis8 r4
    R1
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    f16[^\solo g a b] c8 a16[ g] f[ e] f8 r c'
    d8.[ c32 b] a8[ g] f4 r8 g
    \sbOn \tuplet 3/2 8 { a16[ b a } g f] \sbOff c'8 b16[ a] g4 r8 f
    f16[ e] e8 r d d16[ cis] cis8 r a'
    \tuplet 3/2 8 { b16[ a g] } a b \appoggiatura g8 fis8. g16 g8 d'4 b16[ a]
  }
}

AltoLyrics = \lyricmode {
  Be -- _ ne -- di -- ctus, qui
  ve -- _ nit in
  no -- _ mi -- ne, qui
  ve -- nit, qui ve -- nit in
  no -- mi -- ne Do -- mi -- ni, be -- "ne -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Ariose"
    f,8-\solo f' e c d8. c32 b a8 f
    b4 c d e
    f8 d a b c4 d
    c f e d
    g8 c, d d, g b' fis d
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>8 <5>4. <6>8 <5>
  r4 <6>2 <7>8 <6!>
  <4> <7 3> <5 4> <6 3> <7> <6\\> <4> <_+>
  r <6 _-> <4> <_+>4. r4
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
