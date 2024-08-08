\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Tempo giusto"
    e'4.\fE c'64( h a16.) a16( gis) gis8 a, f'64( e d16.)
    d16( c) c,( d) e( f) f16.\trill e64( f) g16( e') c( a) \appoggiatura g8 f8.\trill e16 \gotoBar "5"
    << { a4 } \\ { a4 } >> r r2
    R1
    r2 r4 r8 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    R1*2 \gotoBar "5"
    e'4~ e16[ c] h[ a] \grace d8 f4 e16[ d] c[ h]
    c[ h a gis] a8 h c8.[\trill h32 c] d8.[\trill c32 d]
    e8.[\trill d32 e] f8.[\trill e32 f] g16[ e] d c \grace c8 d8.\trill c16
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit in no -- _
  _ _ _ mi -- ne Do -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Tempo giusto"
    \mvTr a8\fE-\solo a' g f e d c h
    a a' g f e a d, g \gotoBar "5"
    a, h c f d d'16. h32 gis8 e
    a, h c gis a a' f g
    c, c' a g16 f e8 f g g,
  }
}

BassFigures = \figuremode {
  r2 <4>8 <4\+> <6> <6\\>
  <4> <3> <6> q q4 <7>8 q
  r2 r8.. <\t>32 <6>4
  r8 <6\\> <6> r4. <6 5>4
  r <6> q8 <6 5> <6 4> <5 3>
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "vl" "solo" }
      \ViolinoI
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
