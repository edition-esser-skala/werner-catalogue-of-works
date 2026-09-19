\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'8.\trill\p h32 a g8 f e c r4
    r8 a'16( c) g( c) f,( c') e,8 r r4
    \sbOn \tuplet 3/2 8 { e'16\f d c c h a } \sbOff fis'8 r g,8.\p fis32 e d8 c
    h g r4 r2
    r4 r8 d' e f!16 g g( f) f( e)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    r2 c'8.\trill\p h32 a g8 f
    e16( c) a'( c) g( c) f,( c') e,8 r r4
    r \sbOn \tuplet 3/2 8 { a16\f g fis fis e d } \sbOff d'8 r r4
    g,8.\trill\p fis32 e d8 c h g r4
    r r8 h c d16 e d( d') d( c)
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 g'4.^\solo e16[ fis]
    g8 g,4 e'16[ fis] g8 g, r e'
    f g16 a \appoggiatura a8 g8.\trill f16 e4 r
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit in
  no -- mi -- ne Do -- mi -- ni,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    c'4.^\solo a16[ h] c8 c,4 a'16[ h]
    c8 c, r d e16[ c'] h a g8.\trill f16
    e4 r r2
    R1
    r2 r4 r8 c
  }
}

BassoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit in no -- mi -- ne Do -- mi --
  ni,

  qui
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c8-\solo a' g f e a g f
    e f e d c d e h
    c e d c h e d c
    h e d c h h'16 a h8 g
    a a, h g c c' h c
  }
}

BassFigures = \figuremode {
  r1
  r
  r8 <6> <_+>4 r2
  r2.. <6>8
  <6>4 <6>2.
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
