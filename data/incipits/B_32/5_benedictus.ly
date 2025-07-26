\version "2.24.2"
\include "header.ly"

ViolinoSolo = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    \sbOn e'64( a, h c d e fis? gis) a16 a, \sbOff gis( d') h'( d,) \tuplet 3/2 8 { c h a } a8 r << { a' } \\ { c, } >> \gotoBar "4"
    e16( h) c( a') f( e32 d c h a gis) a4 r
    R1*2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1 \gotoBar "4"
    r2 a'16[^\solo c32 h] a16[ gis] a[ e] c' a
    e'8 e, r h' c8.[\trill h32 a] g[ a h c d16 f,]
    e8 g c4~ c16[ h32 a] g16 f e[\trill d] c[ h]
  }
}

BassoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- _
  nit in no -- mi -- ne Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Largo"
    a'8-\solo c h gis a c16 h c8 a \gotoBar "4"
    gis, a d e a h c a
    gis e16 fis \hA gis8 e a a, h g
    c h a e' f a g g,
  }
}

BassFigures = \figuremode {
  r8 <6> <6\\> <6> r2
  r4. <_+>4 <6\\>8 <6>4
  r1
  r4. <6> <6 4>8 <5 3>
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "vl" "solo" }
      \ViolinoSolo
    }
    \new ChoirStaff <<
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
