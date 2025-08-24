\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Andante"
    R2*2
    e'8\p e~ \tuplet 3/2 8 { \sbOn e16 f g f e d \sbOff }
    e32( g16.) c32( g16.) c32( g16.) e32( g16.)
    d32( g16.) h32( g16.) d'32( h16.) g32( h16.)
    e,32( c'16.) a32( c16.) fis,32( a16.) c,32( \hA fis16.)
    g32( d16.) h32( d16.) h32( g16.) h32( d16.)
    c8 c, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Andante"
    R2*2
    c'8\p c~ \tuplet 3/2 8 { \sbOn c16 d e d c h \sbOff }
    c32( e16.) g32( e16.) c32( e16.) g,32( e'16.)
    h32( d16.) g32( d16.) h32( d16.) h32( g16.)
    c32( e16.) c32( e16.) a,32( c16.) fis,32( a16.)
    h8 g r4
    c32( g16.) e32( g16.) e32( c16.) e32( g16.)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/4 \tempoMarkup "Andante" \autoBeamOff
    g'8^\solo c4 \tuplet 3/2 8 { d16[ c h] }
    c8 c~ \tuplet 3/2 8 { c16[ d e] d[ c h] }
    c8 c, r4
    c8.[\trill e16] e8.[\trill g16]
    g4 g8 g
    a a a4\trill
    g r
    R2
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na __ coe --
  lo -- rum,
  a -- ve __
  Do -- mi -- na
  An -- ge -- lo --
  rum,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/4 \tempoMarkup "Andante" \autoBeamOff
    R2*7
    \once \override Script.outside-staff-priority = #0
      c8.[\trill^\solo e16] e8.[\trill g16]
  }
}

AltoLyrics = \lyricmode {
  a -- ve __
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/4 \tempoMarkup "Andante" \autoBeamOff
    R2*6
    \once \override Script.outside-staff-priority = #0
      g8.[^\solo\trill h16] h8.[\trill c16]
    c8 c16 c c8 e
  }
}

TenoreLyrics = \lyricmode {
  a -- ve __
  Do -- mi -- na An -- "ge -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/4 \tempoMarkup "Andante" \autoBeamOff
    R2*8
  }
}

BassoLyrics = \lyricmode {
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Andante"
    c'8-\solo c, e g
    c c, e g
    c,4 r
    R2*3
    g'8 g, g' f
    e c c' e,
  }
}

BassFigures = \figuremode {
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

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
