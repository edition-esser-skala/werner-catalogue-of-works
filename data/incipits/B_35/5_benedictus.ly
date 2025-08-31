\version "2.24.2"
\include "header.ly"

ViolinoSolo = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Molto largo"
    \sbOn a'16(-\markup \remark "ariose" c') c64( h32.) h64( a32.) gis16( f!) f64( e32.) e64( d32.) \sbOff \tuplet 3/2 8 { c16 h a } a8 << {
      c'4~ \slurNeutral
      c16. c32 h16( a) g4~ g16. g32 f16( e) a4
    } \\ {
      r8 e
      d4~ d16. d32 c16 h e8 r r16 e d cis
    } >> \gotoBar "6"
    a4 r r2
    r8 e' a16( a,) a8 a16( gis) gis8 r4
    R1
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Molto largo"
    R1*2 \gotoBar "6"
    a'8._[^\solo h16] \tuplet 3/2 8 { c[ d e] e[ fis gis] } a8 a, r c
    h16[ dis,] e8 r dis' dis16[ e] e,8 r h'
    c8.[\trill d32 e] d8.[\trill e32 f] e8.[\trill f32 g] f8.[\trill g32 a]
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit in
  no -- _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Molto largo"
    a4-\solo h8 gis a16. a'32 e16. c32 a8 a'
    f d h g c4 cis8 a' \gotoBar "6"
    a,4 r r16 a' c h c8 a
    gis g fis f e e16 fis gis8 e
    a, a' f g c, c' a f
  }
}

BassFigures = \figuremode {
  r4 <6\\>8 <6> r2
  r4 <6>2 r8 <_+>
  r1
  <6>4 <7>8 <6\\> <8 4> <\t _+>4.
  r4 <6 5> r <6>
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = \markup \center-column { "vl" "solo" }
      \ViolinoSolo
    }
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
