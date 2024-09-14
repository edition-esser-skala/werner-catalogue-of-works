\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Passato"
    d''4\f \tuplet 3/2 8 { d16 cis h }
    a4 \tuplet 3/2 8 { h16 a g }
    a8 fis e
    fis d r
    a\p fis e
    fis d r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Passato"
    fis'4\f g8
    fis4 \tuplet 3/2 8 { g16 fis e }
    fis8 d cis
    d a r
    fis\p d cis
    d a r
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 3/8 \tempoMarkup "Passato"
    a'4\f \tuplet 3/2 8 { h16 a g }
    a4 \tuplet 3/2 8 { g16 fis e }
    fis8 a a
    a fis r
    fis,\p a a
    a fis r
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/8 \tempoMarkup "Passato"
    d8 d d
    d d d
    d d' a
    d,4 r8
    d,\p d' a
    d,4 r8
  }
}

BassFigures = \figuremode {
  r4 <6 4>8
  <5 3>4 <6 4>8
  <5 3>4.
  r
  r
  r
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
