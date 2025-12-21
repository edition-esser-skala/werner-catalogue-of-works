\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Andante passato"
    g'32(\f d'16.) c32( d16.) h32( c16.) a32( h16.)
    g32(\p d'16.) c32( d16.) h32( c16.) a32( h16.)
    g32(\pp d'16.) c32( d16.) h32( c16.) a32( h16.)
    g8.\trill\f a32 h c8.\trill h32 a
    g8.\trill a32 h c8.\trill h32 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Andante passato"
    g'32( h16.) a32( h16.) h32( g16.) fis32( a16.)
    g32( h16.) a32( h16.) h32( g16.) fis32( a16.)
    g32( h16.) a32( h16.) h32( g16.) fis32( a16.)
    g8 g, r4
    R2
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Andante passato"
    h4 r8 d
    d4 r8 d\p
    d4 r8 d\f
    h8.\trill c32 d e8.\trill d32 c
    h8.\trill c32 d e8.\trill d32 c
  }
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Andante passato"
    g'4 r8 d
    h g r d'\p
    h g r d'\f
    g,2~-\markup \remark "con Pedale"
    g~
  }
}

BassFigures = \figuremode {
  %tacet
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
