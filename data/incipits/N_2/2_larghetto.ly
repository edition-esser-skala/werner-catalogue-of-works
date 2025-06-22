\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/8 \tempoMarkup "Larghetto"
    a'8.\p b16 a8
    g e r
    f16 g64( a b c) d8 f,
    f-! e-! r
    \tuplet 3/2 8 { e16 f g } g4\trill
    \tuplet 3/2 8 { f16 g a } a4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/8 \tempoMarkup "Larghetto"
    f8.\p g16 f8
    e-! cis-! r
    d f d
    d-! cis-! r
    \tuplet 3/2 8 { cis16 d e } e8([ e')]
    \tuplet 3/2 8 { d,16 e f } f8([ f')]
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/8 \tempoMarkup "Larghetto"
    d4\p r8
    cis a r
    a4 gis8
    a4 r8
    r a a
    r a a
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/8 \tempoMarkup "Larghetto"
    d4\p r8
    e a r
    d, b4
    a r8
    r a a
    r a a
  }
}

BassFigures = \figuremode {
  r4.
  <6\\>8 <_+>4
  r4.
  <6 4> <5 _+>4
  r8 <7 _+>4
  r8 <6 4>4
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
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
