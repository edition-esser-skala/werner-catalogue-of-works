\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    r4 a'8\p h c gis a h
    c a r4 r8 h e4~
    e16 a, c e f4~ f16 g, h d e f e f
    \sbOn \tuplet 3/2 8 { g a g } f a \sbOff \appoggiatura e8 d8.\trill c16 c8 g'4 g8
    g2~\trill g16 e c8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    r4 a'8\p h c gis a h
    c a r4 r8 h e4~
    e16 a, c e f4~ f16 g, h d e f e f
    \sbOn \tuplet 3/2 8 { g a g } f a \sbOff \appoggiatura e8 d8.\trill c16 c8 g'4 g8
    g2~ g16 e c8 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    e'4.^\solo e8 e2
    e8.[ d32 c] h8 a \tuplet 3/2 8 { gis16[ a h] } e,8 r e
    c'4~ c16[ d, f a] h8.[\trill a32 h] c16[ d c d]
    c[ e] d[ c] \appoggiatura c8 h8.\trill c16 c4 c8 d
    e h c d e[ f] g16[ e] d[ c]
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di --
  ctus, __ _ qui ve -- nit in
  no -- _ _
  mi -- ne Do -- mi -- ni, be -- ne --
  di -- ctus, be -- ne -- di -- ctus, qui
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    a8-\solo h c gis a h c gis
    a c d f e8. fis16 gis8 e
    a a, d d' g, g, c a'
    e f g g, c8. d16 e8 h
    c d e h c a' e f
  }
}

BassFigures = \figuremode {
  r4. r4 <6\\ 4>8 <6> r
  r4 <6>8 <3> <_+>2
  r4 <7> q2
  <6>8 q <4> <3>2 r8
  r <6> q r4 <6>8 q q
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
