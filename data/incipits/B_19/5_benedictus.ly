\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    R1
    r8 c'16(-\solo a') g8 f e d c b
    a c b a g b a g
    a f r4 b8 d c b
    h4 r e,8 g f e
    a4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    R1
    r8 a'16(-\solo f') e8 d c b a g
    f a g f e g f e
    f4 r d8 f es d
    g4 r c,8 e d c
    cis4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    f2^\solo c'4. d16[ e]
    f8 f, r4 r2
    c'2 c16[ d e8] f g
    c,4~ c8.\trill b32[ c] d4 r8 d
    d4.\trill c16[ d] e4 r8 e
    e4.\trill d16[ e] f[ e d8] b16[ a g8]
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- _
  di -- ctus,
  qui ve -- nit in
  no -- mi -- ne, in
  no -- mi -- ne, in
  no -- mi -- ne __ "Do -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    f8-\solo a g f e d c b
    a f' e d c b a g
    f4 r c' r
    f8 a g f b,4 r
    g'8 h a g c,4 r
    a8 cis h? a d f g b
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  <_+>2.. <6>8
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
}
