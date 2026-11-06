\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 6/8 \tempoMarkup "Andante"
    d'4.\f g
    h16( g) fis( e) d( c) h( c) d( fis,) g8 \gotoBar "7"
    g4 r8 r4 r8
    r4 r8 r d'16\p c d8
    d d, r r4 r8
    r4 r8 fis16 g a8 h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 6/8 \tempoMarkup "Andante"
    h'16\f c d8 a h16 c d8 e
    d16( g) fis( e) d( c) h( c) d( fis,) g8 \gotoBar "7"
    g4 r8 r4 r8
    r4 r8 r a\p h
    a d, r r4 r8
    r4 r8 d16 e fis8 g
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key g \major \time 6/8 \autoBeamOff \tempoMarkup "Andante"
    R2.*2 \gotoBar "7"
    h8[ c] d g,4 e'8
    d[ c] h a d, r
    a'4 h8 c16([ d e8)] d16[ c]
    h([ c d8)] g, fis4 r8
  }
}

SoliLyrics = \lyricmode {
  Mi braucht man zu
  al -- len Sa -- chen
  waß in Dorf nur
  im -- mer iſt,
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 6/8 \tempoMarkup "Andante"
    g8 g' fis e d c
    h c d g d h \gotoBar "7"
    g'4 fis8 e d c
    h a g fis fis' g
    fis e d e4 fis8
    g h, c d4 r8
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r4 <6>8 q4 q8
  r2.
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
        \set Staff.instrumentName = "Schullmeiſter"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { indent = 1.5\cm }
}
